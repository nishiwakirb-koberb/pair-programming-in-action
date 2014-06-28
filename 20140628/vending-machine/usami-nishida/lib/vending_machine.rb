class VendingMachine
  attr_accessor :amount
  def initialize
    @amount = 0
  end

  def insert(coin)
    @amount += coin
  end

  def refund()
    @amount
  end

end
