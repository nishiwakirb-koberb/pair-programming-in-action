require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize str
    number, orders = str.split(':')
    chairs = Array.new([Chair.new ] *number.to_i)
    update_chairs(chairs, order)
    @result = chairs.map{ |c| c.state }.join
  end

  def update_chairs chairs,orders
    orders.each do |order| do
      chairs.update(order)
    end
  end


 class Chair
  attr_reader :state

  def initialize
    @state = '-'
  end

  def update person
    @state = person
  end
 end

end

