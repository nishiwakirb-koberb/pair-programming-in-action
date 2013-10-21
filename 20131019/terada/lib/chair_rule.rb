require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize orders
    number, people = parse orders
    chairs = Array.new(number) { Chair.new }
    @result = chairs.map(&:state).join
  end

  def parse orders
    [orders.split(':').first.to_i, orders.split(':').last.split(//)]
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

