class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end


  def add(money)
    return money if invalid? money

    @amount += money
    nil
  end

  def repay
    tmp = amount
    @amount = 0
    tmp
  end

  private
  def invalid?(money)
    ![10, 50, 100, 500, 1000].include?(money)
  end

end
