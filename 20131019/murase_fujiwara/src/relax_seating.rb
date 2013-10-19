require 'pp'

def vacant_seat_index(seats)
  virtual_seats = "-" + seats + "-"

  (virtual_seats =~ /---/) or
  (virtual_seats =~ /--\w|\w--/) or
  seats.index('-')

  # if idx = (virtual_seats =~ /---/)
  #   return idx
  # end
  # if idx = (virtual_seats =~ /--\w|\w--/)
  #   return idx
  # end
  # seats.index('-')
end

def relax_seating(input)
  num, sequence = input.split(':')
  seats = "-" * num.to_i
  sequence.each_char do |c|
    if c.upcase == c
      idx = vacant_seat_index(seats)
      seats[idx] = c
    else
      idx = seats.index(c.upcase)
      seats[idx] = '-'
    end
  end
  seats
end
