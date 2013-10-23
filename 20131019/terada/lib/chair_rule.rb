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
    first_chair_of_all_empty_chairs or
      both_sides_empty_chair or
      one_side_empty_chair or
      first_or_last_chair or
      first_empty_chair
  end

  # Called by next_chair in this order ===================
  def first_chair_of_all_empty_chairs
    @chairs.first if @chairs.all?(&:empty?)
  end

  def both_sides_empty_chair
    # l, c, r = left, center, right
    if lcr = @chairs.each_cons(3).find {|lcr| lcr.all?(&:empty?) }
      lcr[1]
    end
  end

  def one_side_empty_chair
    if lcr = @chairs.each_cons(3).find {|_, c, r| [c, r].all?(&:empty?) }
      _, c, r = lcr
      @chairs.last == r ? r : c
    end
  end

  def first_or_last_chair
    [@chairs.first, @chairs.last].find(&:empty?)
  end

  def first_empty_chair
    @chairs.find(&:empty?)
  end
  # Called by next_chair in this order ===================

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
