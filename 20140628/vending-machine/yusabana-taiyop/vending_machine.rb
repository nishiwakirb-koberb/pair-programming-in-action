require './drink'

class VendingMachine
  attr_reader :amount
  attr_reader :drinks

  def initialize
    @amount = 0
    @drinks =[]

    5.times {@drinks << Drink.coke}
  end

  def add(money)
    return money if invalid? money

    @amount += money
    nil
  end

  def repay
    repay_money, @amount = @amount, 0
    repay_money
  end

  private
  def invalid?(money)
    ![10, 50, 100, 500, 1000].include?(money)
  end
end
