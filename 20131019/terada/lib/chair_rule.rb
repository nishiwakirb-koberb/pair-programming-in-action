require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize orders
    number, people = parse orders
    @chairs = Array.new(number) { |i| Chair.new(i) }
    update_chairs people
    @result = @chairs.map(&:person).join
  end

  def parse orders
    [orders.split(':').first.to_i, orders.split(':').last.split(//)]
  end

  def update_chairs people
    people.each do |person|
      # byebug
      exit?(person) ?
        find_by_person(person).empty! : next_chair.update!(person)
    end
  end

  def next_chair
    last_id = @chairs.size - 1
    ret = nil
    empties.each do |chair|
      # byebug
      if @chairs.size < 3 or empties.size == 1 or empties.size == @chairs.size
        return empties.first
      elsif (1..(last_id - 1)).include? chair.id
        if right_chair(chair).empty? and left_chair(chair).empty?
          return chair
        elsif right_chair(chair).empty?
          return chair if empties.size < last_id and !find_by_id(last_id).empty?
        elsif left_chair(chair).empty?
          return chair unless chair.id == 1
        end
      elsif chair.id == last_id
        return chair
      end
    end
    empties.first
  end

  def exit? person
    person == person.downcase
  end

  def find_by_id id
    @chairs.find{ |chair| chair.id == id }
  end

  def find_by_person person
    @chairs.find{ |chair| chair.person == person.upcase }
  end

  def empties
    @chairs.select{ |chair| chair.empty? }
  end

  def right_chair chair
    find_by_id(chair.id + 1)
  end

  def left_chair chair
    find_by_id(chair.id - 1)
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


