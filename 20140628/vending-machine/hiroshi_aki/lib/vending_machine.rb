class VendingMachine
  attr_reader :total

  def initialize
    @total = 0
  end

  def insert amount
    @total += amount
  end

  def refund
    refund_amount = @total
    @total = 0
    refund_amount
  end
end
