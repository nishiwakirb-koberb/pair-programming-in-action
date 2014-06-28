class VendingMachine
  attr_reader :total

  USABLE_CURRENCIES = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
  end

  def insert amount
    currency_check(amount) ? @total += amount : amount
  end

  def refund
    refund_amount = @total
    @total = 0
    refund_amount
  end

  def currency_check amount
    USABLE_CURRENCIES.include?(amount)
  end
end
