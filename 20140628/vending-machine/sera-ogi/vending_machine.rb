class VendingMachine
  attr_accessor :money, :returned_money
  MONEYS = [10, 50, 100, 500, 1000]
  BADMONEYS = [1, 5, 2000, 5000, 10000]

  def initialize
    @money = 0
  end

  def put_money= x
  	case x
  	when *MONEYS
  	  @money += x
  	when *BADMONEYS
  	  @returned_money += x
  	end

  end

  def total_money
    @money
  end

  def return_money
    @returned_money += @money
    @money = 0
  end

end
