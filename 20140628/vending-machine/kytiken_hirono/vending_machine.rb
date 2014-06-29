class VendingMachine
  attr_reader :paid_amount, :juice_name, :juice_price, :juice_stock, :sale_amount

  def initialize
    @paid_amount = 0
    @juice_name = "コーラ"
    @juice_price = 120
    @juice_stock = 5
    @sale_amount = 0
  end

  def insert(inserted)
    unless acceptable?(inserted)
      return inserted
    else
      @paid_amount += inserted
      return nil
    end
  end

  def refund
    refund_amount = @paid_amount
    @paid_amount = 0
    return refund_amount
  end

  def purchase
    if can_purchase?
      @juice_stock -= 1
      @sale_amount += @juice_price
      @paid_amount -= @juice_price
    end
  end

  def can_purchase?
    return @juice_stock > 0 && paid_amount >= juice_price
  end

  private

  def acceptable?(inserted)
    case inserted
    when 10, 50, 100, 500, 1000
      return true
    else
      return false
    end
  end

end
