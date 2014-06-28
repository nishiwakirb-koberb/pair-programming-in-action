class VendingMachine
  attr_accessor :amount
  VALID_COINS = [10,50,100,500,1000]

  class Juice
    attr_accessor :price, :name

    def initialize(price, name)
      self.price = price
      self.name = name
    end

    def to_hash
      {
        price: price,
        name: name,
      }
    end
  end

  def initialize
    @amount = 0
    @stocks = []
    5.times { @stocks << Juice.new(120, "cola") }
  end

  def insert(coin)
    @amount += coin if VALID_COINS.include? coin
  end

  def refund()
    @amount
  end

  def stocks
    @stocks.group_by {|juice| [juice.name, juice.price] }.map { |k,v|
      v.first.to_hash.merge(amount: v.size)
    }
  end
end
