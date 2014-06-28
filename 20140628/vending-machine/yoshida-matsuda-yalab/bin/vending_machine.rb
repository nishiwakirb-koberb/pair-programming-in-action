# -*- coding: utf-8 -*-


# 自動販売機クラス
class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000]
  attr_reader :stock, :total
  def initialize
    @total = 0
    @stock = Array.new(5, Drink.new(name: "cola", price: 120))
  end

  # コインを投入する
  def input(coin)
    if ACCEPTABLE_MONEY.include?(coin)
      @total += coin
      true
    else
      false
    end
  end

  # 払い戻し操作を行う
  def refund
    pay_back = @total
    @total = 0
    pay_back
  end
end

class Drink
  attr_accessor :name, :price
  def initialize(name: name, price: price)
    @name = name
    @price = price
  end
end

