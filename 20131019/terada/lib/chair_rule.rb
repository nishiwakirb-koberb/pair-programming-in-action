require 'pry-byebug'
require 'byebug'

class ChairRule
  def initialize orders
    @number, @people = orders.split(':')
  end

  def result
    @chairs = ('-' * @number.to_i).chars
    update_chairs @people.chars
    @chairs.join
  end

  private

  def update_chairs people
    people.each do |person|
      person =~ /[a-z]/ ? vacant!(person) : next_chair.sub!('-', person)
    end
  end

  def vacant! person
    @chairs.find{|c| c == person.upcase }.sub!(/[A-Z]/, '-')
  end

  def find_by_person person
    @chairs.find {|chair| chair.person == person.upcase }
  end

  def next_chair
    both_sides_vacant_chair or
      one_side_vacant_chair or
      first_or_last_chair or
      first_vacant_chair
  end

  # Called by next_chair in this order ===================
  def both_sides_vacant_chair
    # l, c, r = left, center, right
    if @chairs.all?(&:vacant?)
      @chairs.first
    elsif lcr = @chairs.each_cons(3).find {|lcr| lcr.all?(&:vacant?) }
      lcr[1]
    end
  end

  def one_side_vacant_chair
    if lcr = @chairs.each_cons(3).find {|_, c, r| [c, r].all?(&:vacant?) }
      _, c, r = lcr
      @chairs.last == r ? r : c
    end
  end

  def first_or_last_chair
    [@chairs.first, @chairs.last].find(&:vacant?)
  end

  def first_vacant_chair
    @chairs.find(&:vacant?)
  end
  # Called by next_chair in this order ===================

  class ::String
    def vacant?
      self == '-'
    end
  end
end
