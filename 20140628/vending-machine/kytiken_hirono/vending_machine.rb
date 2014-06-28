class VendingMachine
  attr_accessor :paid_amount

  def initialize
    @paid_amount = 0
  end

  def payment_insert payment
    @paid_amount += payment
  end

  def refund
    refund_amount = @paid_amount
    @paid_amount = 0
    return refund_amount
  end
end
