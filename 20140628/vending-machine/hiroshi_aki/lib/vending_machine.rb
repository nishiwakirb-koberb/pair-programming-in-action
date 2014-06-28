class VendingMachine
  attr_reader :total

  def initialize
    @total = 0
  end

  def insert amount
    @total += amount
  end

end
