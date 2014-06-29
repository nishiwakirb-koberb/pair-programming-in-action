class VendingMachine
  attr_reader :paid_amount, :sale_amount

  def initialize
    @paid_amount = 0
    @sale_amount = 0
    @slots = [ Slot.new('コーラ', 120, 5), Slot.new('レッドブル', 200, 5), Slot.new('水', 100, 5) ]
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

  def can_purchase?(name)
    find_item(name).can_purchase?(paid_amount)
  end

  def items
    @slots.map(&:information)
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

  def find_item(name)
    @slots.find {|slot| slot.name == name} || SENTINEL
  end

  class Slot
    attr_reader :name, :price, :stock
    def initialize(name, price, stock = 0)
      @name = name
      @price = price
      @stock = stock
    end

    def information
      ItemInformation.new(@name, @price, @stock)
    end

    def can_purchase?(paid_amount)
      @stock > 0 && paid_amount >= @price
    end
  end

  SENTINEL = Slot.new('', 0, 0)

  class ItemInformation
    attr_reader :name, :price, :stock
    def initialize(name, price, stock)
      @name = name
      @price = price
      @stock = stock
    end

    def ==(other)
      ItemInformation === other && @name == other.name && @price == other.price && @stock == other.stock
    end
  end

end
