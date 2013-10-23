require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize orders
    number, people = orders.split(':')
    @chairs = Array.new(number.to_i) { |i| Chair.new(i) }
    update_chairs people.chars
    @result = chairs.map(&:person).join
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

  def chairs
    @chairs
  end

  def only_one_chair
    empties.size == chairs.size ?
      empties.first : false
  end

  def both_sides_empty
    empties.find { |chair| has_sides?(chair) and right_chair(chair).empty? and left_chair(chair).empty? } || false
  end

  def oneside_empty
    empties.select{ |chair| has_sides?(chair) and right_chair(chair).empty? }.each do |chair|
      if is_last?(right_chair(chair))
        return right_chair(chair)
      else
        return chair
      end
    end
    false
  end

  def final_chair
    empties.find { |chair| is_last?(chair) and left_chair(chair).empty? } || false
  end

  def primary_sides_of_chairs
    empties.each do |chair|
      if chair.id == 0
        return chair
      elsif is_last?(chair)
        return chair
      end
    end
    false
  end

  def find_by_id id
    chairs.find{ |chair| chair.id == id }
  end

  def find_by_person person
    chairs.find{ |chair| chair.person == person.upcase }
  end

  def empties
    chairs.select{ |chair| chair.empty? }
  end

  def right_chair chair
    find_by_id(chair.id + 1)
  end

  def left_chair chair
    find_by_id(chair.id - 1)
  end

  def is_last? chair
    chair.id == chairs.size - 1
  end

  def has_sides? chair
    (1..(chairs.size - 2)).include? chair.id
  end

  class Chair
    attr_reader :person, :id

    def initialize id
      empty!
      @id = id
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
