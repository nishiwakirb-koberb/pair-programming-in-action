class Drink
  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def self.coke
    new(name: "コーラ", price: 120)
  end
end
