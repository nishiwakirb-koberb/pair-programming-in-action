def x(seats, c)
  virtual_seats = "-" + seats + "-"
  
  rs = [/(?<=-)-(?=-)/, /(?<=-)-(?=\w)|(?<=\w)-(?=-)/, /(?<=\w)-(?=\w)/]
  rs.each do |r|
    if virtual_seats =~ r
      replaced = virtual_seats.sub r, c
      return replaced[1...-1]
    end
  end
end

def relax_seating(input)
  num, sequence = input.split(':')
  seats = "-" * num.to_i
  sequence.each_char do |c|
    if c.upcase == c
      seats = x(seats, c)
    else
      seats = seats.sub(c.upcase, '-')
    end
  end
  seats
end
