require 'pp'

def vacant_seat_index(seats)
  seats.index('-')
end

def seat_index(seats, char)
  seats.index(char)
end

def relax_seating(input)
  num, sequence = input.split(':')
  seats = "-" * num.to_i
  sequence.each_char do |c|
    if c.upcase == c
      idx = vacant_seat_index(seats)
      seats[idx] = c
    else
      idx = seat_index(seats, c.upcase)
      seats[idx] = '-'
    end
  end
  seats
end
