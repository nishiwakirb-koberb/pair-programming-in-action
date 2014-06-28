class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @inserted_moneies = []
    @juices = [{name: 'cola', price: 120, amount: 5}]
  end

  def insert(money)
    if ACCEPTABLE_MONEY.include?(money)
      @inserted_moneies << money
      nil
    else
      money
    end
  end

  def amount
    @inserted_moneies.inject(0, &:+)
  end

  def refund
    moneies = @inserted_moneies.dup
    @inserted_moneies.clear
    moneies
  end

  def juice_info
    @juices.map(&:dup)
  end
end
