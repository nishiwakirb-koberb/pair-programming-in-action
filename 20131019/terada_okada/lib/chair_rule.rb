require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize str
    number, order = str.split(':')
    chairs = Array.new([Chair.new ] *number.to_i)
    @result = chairs.map{ |c| c.state }.join
  end


   class Chair
    attr_reader :state

    def initialize
      @state = '-'
    end

    def update
    end
   end

end

