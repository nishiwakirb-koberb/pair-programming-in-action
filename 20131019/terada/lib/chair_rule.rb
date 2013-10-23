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
    only_one_chair or both_sides_empty or oneside_empty or final_chair or primary_sides_of_chairs or empties.first
  end

  def only_one_chair
    empties.first if empties.size == @chairs.size
  end

  def both_sides_empty
    empties.find {|chair| has_sides?(chair) and right_chair(chair).empty? and left_chair(chair).empty? }
  end

  def oneside_empty
    empties.select {|chair| has_sides?(chair) and right_chair(chair).empty? }.each do |chair|
      r_chair = right_chair(chair)
      return is_last?(r_chair) ? r_chair : chair
    end
    false
  end

  def final_chair
    empties.find {|chair| is_last?(chair) and left_chair(chair).empty? }
  end

  def primary_sides_of_chairs
    empties.find {|chair| chair.index == 0 or is_last?(chair) }
  end

  def find_by_index index
    @chairs.find {|chair| chair.index == index }
  end

  def find_by_person person
    @chairs.find {|chair| chair.person == person.upcase }
  end

  def empties
    @chairs.select {|chair| chair.empty? }
  end

  def right_chair chair
    find_by_index(chair.index + 1)
  end

  def left_chair chair
    find_by_index(chair.index - 1)
  end

  def is_last? chair
    chair.index == @chairs.size - 1
  end

  def has_sides? chair
    (1..(@chairs.size - 2)).include? chair.index
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
