# -*- coding: utf-8 -*-


# 自動販売機クラス
class VendingMachine
  def initialize
    @total = 0
  end

  # コインを投入する
  def input(coin)
    if coin == 1
      return false
    end
    
    @total += coin
    return true
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
