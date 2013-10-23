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

  def next_chair
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
      self == '-'
    end
  end
end
