require 'pp'

def vacant_seat_index(seats)
  seats.index('-')
end

def relax_seating(input)
  num, sequence = input.split(':')
  seats = "-" * num.to_i
  sequence.each_char do |c|
    if c.upcase == c
      idx = vacant_seat_index(seats)
      seats[idx] = c
    else
      seats[0] = '-'
    end
  end
  seats
end
