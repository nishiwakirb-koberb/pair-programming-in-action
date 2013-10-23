class ChairRule
  VACANT = '-'

  def initialize orders
    @number, @people = orders.split(':')
  end

  def result
    @chairs = (VACANT * @number.to_i).chars
    update_chairs!
    @chairs.join
  end

  private

  def update_chairs!
    @people.chars.each do |person|
      person =~ /[A-Z]/ ? occupy!(person) : vacant!(person)
    end
  end

  def vacant! person
    @chairs.find{|c| c == person.upcase }.sub!(/[A-Z]/, VACANT)
  end

  def occupy! person
    best_vacant_chair.sub!(VACANT, person)
  end

  def best_vacant_chair
    both_sides_vacant_chair or one_side_vacant_chair or @chairs.find(&:vacant?)
  end

  def both_sides_vacant_chair
    if @chairs[0..1].all?(&:vacant?)
      @chairs.first
    elsif lcr = @chairs.each_cons(3).find {|lcr| lcr.all?(&:vacant?) }
      lcr[1]
    elsif @chairs[-2..-1].all?(&:vacant?)
      @chairs.last
    end
  end

  def one_side_vacant_chair
    if @chairs.first.vacant?
      @chairs.first
    elsif lcr = @chairs.each_cons(3).find {|l, c, r| c.vacant? and [l, r].any?(&:vacant?) }
      lcr[1]
    elsif @chairs.last.vacant?
      @chairs.last
    end
  end

  class ::String
    def vacant?
      self == VACANT
    end
  end
end
