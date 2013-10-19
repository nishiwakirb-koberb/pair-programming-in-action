

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

