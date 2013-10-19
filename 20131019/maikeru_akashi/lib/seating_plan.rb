class SeatingPlan
  def initialize input
    @input = input
    analyze
  end

  def output
    @output
  end

  private
  def analyze
    bench_size, attendees_raw = @input.split(':')
    @attendees = Attendees.new
    attendees_raw.each_char do |attendee_name|
      @attendees.add attendee_name
    end
    @output = ''
    @attendees.each do |attendee|
      @output += attendee.name
    end
  end
end

class Attendees
  def initialize
    @attendees = Array.new
  end

  def add attendee_name
    unless include?(attendee_name)
      @attendees << Attendee.new(attendee_name)
    else
      delete(attendee_name)
    end
  end

  def delete attendee_name
    tmp = Array.new
    @attendees.each do |attendee|
      unless attendee.name == attendee_name.upcase
        tmp << attendee
      else
        tmp << Attendee.new('-')
      end
    end
    @attendees = tmp
  end

  def each(&block)
    @attendees.each(&block)
  end

  def include? attendee_name
    @attendees.each do |attendee|
      if attendee.name == attendee_name.upcase
        return true
      end
    end
    false
  end
end

class Attendee
  attr_reader :name
  def initialize name
    @name = name
  end
end
