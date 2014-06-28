# -*- coding: utf-8 -*-


# 自動販売機クラス
class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000]
  def initialize
    @total = 0
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

  # 合計金額を返す
  def total()
    return @total
  end

  # 払い戻し操作を行う
  def refound()
    return @total
  end
end
