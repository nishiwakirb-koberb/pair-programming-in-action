

class RelaxSeat

  def initialize( input )
    arr = input.split( /:/ )
    @seats = Array.new( arr[0].to_i, "-" )
		if arr[1]
	    @persons = arr[1].split(nil)
	    sit @persons[0]
	  end
  end

  def sit(person)
		@seats[0] = person
  end

  def to_s
    @seats.join("")
  end
end

