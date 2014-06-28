class VendingMachine
  attr_accessor :paid_amount

  def initialize
    @paid_amount = 0
  end

  def payment_insert payment
    unless check_amount(payment)
      return payment
    else
      @paid_amount += payment
      return nil
    end
  end

  def check_amount amount
    case amount
    when 10, 50, 100, 500, 1000
      return true
    else
      return false
    end
  end

  def refund
    refund_amount = @paid_amount
    @paid_amount = 0
    return refund_amount
  end
end
