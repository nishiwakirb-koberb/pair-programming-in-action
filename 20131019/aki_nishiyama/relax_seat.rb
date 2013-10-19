

class RelaxSeat

  def initialize( input )
    arr = input.split( /:/ )
    @seats = Array.new( arr[0].to_i, "-" )
  end

  def to_s
    @seats.join("")
  end
end

