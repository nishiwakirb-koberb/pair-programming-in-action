require 'pry-byebug'
require 'byebug'

class ChairRule
  def initialize orders
    @number, @people = orders.split(':')
  end

  def result
    @chairs = Array.new(@number.to_i) { Chair.new }
    update_chairs @people.chars
    @chairs.map(&:person).join
  end

  private

  def update_chairs people
    people.each do |person|
      person =~ /[a-z]/ ? find_by_person(person).empty! : next_chair.update!(person)
    end
  end

  def find_by_person person
    @chairs.find {|chair| chair.person == person.upcase }
  end

  def next_chair
    only_one_chair or
      both_sides_empty_chair or
      one_side_empty_chair or
      final_chair or
      both_ends_chair or
      first_empty_chair
  end

  # Called by next_chair in this order ===================
  def only_one_chair
    empty_chairs.first if empty_chairs.size == @chairs.size
  end

  def both_sides_empty_chair
    empty_chairs.find {|chair|
      between_chairs?(chair) and right_chair(chair).empty? and left_chair(chair).empty?
    }
  end

  def one_side_empty_chair
    empty_chairs.select {|chair| between_chairs?(chair) and right_chair(chair).empty? }.each do |chair|
      r_chair = right_chair(chair)
      return last_chair?(r_chair) ? r_chair : chair
    end
    false
  end

  def final_chair
    empty_chairs.find {|chair|
      last_chair?(chair) and left_chair(chair).empty?
    }
  end

  def both_ends_chair
    empty_chairs.find {|chair|
      first_chair?(chair) or last_chair?(chair)
    }
  end

  def first_empty_chair
    empty_chairs.first
  end
  # Called by next_chair in this order ===================

  def empty_chairs
    @chairs.select {|chair| chair.empty? }
  end

  def left_chair chair
    @chairs[chair_index(chair) - 1]
  end

  def right_chair chair
    @chairs[chair_index(chair) + 1]
  end

  def chair_index(chair)
    @chairs.index(chair)
  end

  def first_chair? chair
    @chairs.first == chair
  end

  def last_chair? chair
    @chairs.last == chair
  end

  def between_chairs? chair
    @chairs[1...-1].include? chair
  end

  class Chair
    attr_reader :person

    def initialize
      empty!
    end

    def update! person
      @person = person
    end

    def empty!
      @person = '-'
    end

    def empty?
      @person == '-'
    end
  end
end
