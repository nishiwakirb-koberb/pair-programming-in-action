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
    @attendees = Array.new
    attendees_raw.each_char do |attendee_name|
      @attendees << Attendee.new(attendee_name)
    end
    @output = ''
    @attendees.each do |attendee|
      @output += attendee.name
    end
  end
end

class Attendee
  attr_reader :name
  def initialize name
    @name = name
  end
end

