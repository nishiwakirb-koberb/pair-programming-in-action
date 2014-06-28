class VendingMachine
  attr_accessor :amount
  VALID_COINS = [10,50,100,500,1000]

  def initialize
    @amount = 0
  end

  def insert(coin)
    @amount += coin if VALID_COINS.include? coin 
  end

  def refund()
    @amount
  end

end
