class VendingMachine
  attr_accessor :money

  def initialize
    @money = 0
  end

  def put_money= x
    @money += x
  end

  def total_money
    @money
  end

  def return_money
    @money
  end
end
