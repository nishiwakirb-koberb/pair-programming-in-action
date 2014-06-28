


class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  
  def initialize
    @inserted_moneies = []
  end

  def insert(money)
    # @inserted_moneies << money

    if ACCEPTABLE_MONEY.include? money
      @inserted_moneies << money
      nil
    else
      money
    end
  end

  # def amount_inserted_moneies
  def amount
    @inserted_moneies.inject(0, &:+)
  end

  
  def refund
    @inserted_moneies
  end

end
