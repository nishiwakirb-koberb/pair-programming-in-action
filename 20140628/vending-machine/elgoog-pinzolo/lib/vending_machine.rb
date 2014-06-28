class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @inserted_moneies = []
    @juices = [{name: 'cola', price: 120, amount: 5}]
    @sales_amount = 0
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

  def can_buy?(juice_name)
    target_juice_info = @juices.find { |juice_info| juice_info[:name] == juice_name }
    return false if target_juice_info == nil
    amount >= target_juice_info[:price]
  end

  def buy(juice_name)
    return unless can_buy?(juice_name)
    target_juice_info = @juices.find { |juice_info| juice_info[:name] == juice_name }

    @sales_amount += target_juice_info[:price]
    @juices.delete(target_juice_info)
  end

  
  
end
