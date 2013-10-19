require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize str
    number, orders = str.split(':')
    chairs = []
    number.to_i.times {|i| chairs << Chair.new(i)}
    # byebug
    update_chairs(chairs, orders)
    @result = chairs.map{ |c| c.state }.join
  end

  def update_chairs chairs,orders
    orders.chars.each do |order|
      next_chair = good_chair(chairs)
      if check_type(order)
        next_chair.update(order)
      else
        search_chair(chairs, order).update('-')
      end
    end
  end

  def search_chair chairs, order
    chairs.find{ |chair| chair.state == order.capitalize } || false
  end

  def check_type order
    order == order.upcase ?
      true : false
  end

  def good_chair chairs
    return chairs.first if chairs.find{ |chair| !chair.empty? }
    ret = ''
    empty_chairs(chairs).each do |chair|
      idx = chairs.index(chair)

      if empty_chairs(chairs).size > 2
        ## どちら側の隣にも人が座っていない席を選ぶ。
        if chair == chairs.last
          right_idx = -1
        else
          right_idx = idx + 1
        end

        if chairs[right_idx].empty? && chairs[idx - 1].empty?
          ret = chairs
        end
      else
        ret = empty_chairs(chairs).first
      end
    end
    ret
  end

  def empty_chairs chairs
    byebug
    chairs.find_all{ |chair| chair.empty? }
  end


 class Chair
  attr_reader :id, :state

  def initialize id
    @id = id
    @state = '-'
  end

  def update order
    @state = order
  end

  def empty?
    @state == '-'
  end
 end

end

