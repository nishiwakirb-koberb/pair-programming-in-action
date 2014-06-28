# -*- coding: utf-8 -*-

class VendingMachine
  def initialize
    @amount = 0
    @stock_name  = "コーラ"
    @stock_price = 120
    @stock_num   = 5
  end

  def insert(money)
    case money
    when 10, 50, 100, 500, 1000
      # acceptable coin or bill
    else
      return money
    end

    @amount += money
    0
  end

  def amount
    @amount
  end

  def refund
    change = @amount
    @amount = 0
    change
  end

  def stock
    {
      @stock_name => {
        price: @stock_price,
        num: @stock_num,
      },
    }
  end
end
