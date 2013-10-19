class RelaxSit
  def come_and_go(input)
    chair_count = input[/\d+/].to_i

    @chairs = []
    chair_count.times do
      @chairs << Chair.new
    end

    @chairs.each_with_index do |chair, index|
      prev_exists = true
      next_exists = true
      if index == 0
        prev_exists = false
      end
      if index == @chairs.size - 1
        next_exists = false
      end
      if prev_exists
        chair.prev_chair = @chairs[index - 1]
      end
      if next_exists
        chair.next_chair = @chairs[index + 1]
      end
    end

    people = input[/[a-zA-Z]+/].chars
    people.each do |person|
      if person =~ /[A-Z]/
        chair = find_empty_chair
        chair.seated_person = person
      else
        chair = find_seated_chair(person)
        chair.seated_person = nil
      end
    end
    @chairs.map{|chair| chair.to_s }.join
  end

  def find_empty_chair
    empty_chairs = @chairs.select{|chair| chair.empty? }
    max_count = empty_chairs.map{|chair| chair.side_empty_count }.max
    empty_chairs.select{|chair| chair.side_empty_count == max_count }.first
  end

  def find_seated_chair(person)
    @chairs.select{|chair| chair.seated_person == person.upcase}.first
  end

  class Chair
    attr_accessor :prev_chair, :next_chair
    attr_accessor :seated_person

    def initialize
      @seated_person = nil
    end

    def empty?
      seated_person.nil?
    end

    def seated?
      !self.empty?
    end

    # 両側空き = 2, 片側空き = 1, 両側空きなし = 0
    def side_empty_count
      count = 2
      if !prev_chair.nil? && prev_chair.seated?
        count = count - 1
      end
      if !next_chair.nil? && next_chair.seated?
        count = count - 1
      end
      count
    end

    def to_s
      if self.empty?
        '-'
      else
        self.seated_person
      end
    end
  end
end
