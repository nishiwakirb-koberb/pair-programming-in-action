# -*- coding: utf-8 -*-

class VendingMachine
  def initialize
    @amount = 0
  end

  def insert(money)
    case money
    when 10, 50, 100, 500, 1000
      0
    end

    @amount += money
    0
  end

  def amount
    @amount
  end
end
