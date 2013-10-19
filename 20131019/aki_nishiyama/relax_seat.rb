

class RelaxSeat

  def initialize( input )
    seats, persons = split_token(input)
    
    @seats = Array.new( seats.to_i, "-" )
    parse persons
  end
	
  def split_token(token)
    seats, persons = token.split( /:/ )    

    persons ||= ""
    persons = persons.split("")

    [seats, persons]
  end

  def parse(series)
    series.each do |person|
      if person =~ /[A-Z]/
        sit person
      elsif person =~ /[a-z]/
        leave person
      end	  		
    end
  end

  def is_out_of_seats( index )
    if index < 0 
      false
    else
      !@seats[index]
    end
  end

  def is_empty_here( index )
    is_out_of_seats( index ) || @seats[index] == "-"
  end

  def is_empty_left( index )
    is_empty_here( index-1 )
  end

  def is_empty_right( index )
    is_empty_here( index+1 )    
  end

  def is_empty_lr( index )
    is_empty_left( index ) && is_empty_here( index ) && is_empty_right( index )
  end

  def search_empty_lr()
    found = -1
    @seats.each_index { |index|
      if is_empty_lr( index )
        found = index
        break
      end
    }
    found
  end

  def sit(person)
    @seats[0] = person
  end

  def leave(person)
    @seats[0] = "-"
  end

  def to_s
    @seats.join("")
  end
end

