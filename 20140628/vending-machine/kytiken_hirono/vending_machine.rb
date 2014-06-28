class VendingMachine
  attr_reader :paid_amount, :juice_name, :juice_price, :juice_stock

  def initialize
    @paid_amount = 0
    @juice_name = "コーラ"
    @juice_price = 120
    @juice_stock = 5
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
