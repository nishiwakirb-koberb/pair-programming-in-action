class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def add(money)
    @amount += money
  end

  def repay
    tmp = amount
    @amount = 0
    tmp
  end

end
