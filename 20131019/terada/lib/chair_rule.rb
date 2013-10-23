require 'pry-byebug'
require 'byebug'

class ChairRule
  def initialize orders
    @number, @people = orders.split(':')
  end

  def result
    @chairs = Array.new(@number.to_i) {|i| Chair.new(i) }
    update_chairs @people.chars
    @chairs.map(&:person).join
  end

  private

  def update_chairs people
    people.each do |person|
      person =~ /[a-z]/ ? find_by_person(person).empty! : next_chair.update!(person)
    end
  end

  def next_chair
    only_one_chair or
      both_sides_empty or
      one_side_empty or
      final_chair or
      primary_sides_of_chairs or
      empty_chairs.first
  end

  def only_one_chair
    empty_chairs.first if empty_chairs.size == @chairs.size
  end

  def both_sides_empty
    empty_chairs.find {|chair|
      has_sides?(chair) and right_chair(chair).empty? and left_chair(chair).empty?
    }
  end

  def one_side_empty
    empty_chairs.select {|chair| has_sides?(chair) and right_chair(chair).empty? }.each do |chair|
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

  def primary_sides_of_chairs
    empty_chairs.find {|chair|
      first_chair?(chair) or last_chair?(chair)
    }
  end

  def find_by_person person
    @chairs.find {|chair| chair.person == person.upcase }
  end

  def empty_chairs
    @chairs.select {|chair| chair.empty? }
  end

  def right_chair chair
    find_by_index(chair.index + 1)
  end

  def left_chair chair
    find_by_index(chair.index - 1)
  end

  def find_by_index index
    @chairs.find {|chair| chair.index == index }
  end

  def first_chair? chair
    @chairs.first == chair
  end

  def last_chair? chair
    @chairs.last == chair
  end

  def has_sides? chair
    @chairs[1...-1].include? chair
  end

  class Chair
    attr_reader :person, :index

    def initialize index
      empty!
      @index = index
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
