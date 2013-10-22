def replace(seats, c)
  virtual_seats = "-#{seats}-"
  
  rs = [/(?<=-)-(?=-)/, /(?<=-)-(?=\w)|(?<=\w)-(?=-)/, /(?<=\w)-(?=\w)/]
  virtual_seats.sub(rs.find{|r| virtual_seats.match(r) }, c)[1...-1]
end

def relax_seating(input)
  num, sequence = input.split(':')

  sequence.each_char.inject("-" * num.to_i) {|seats, c|
    c.upcase == c ? replace(seats, c) : seats.sub(c.upcase, '-')
  }
end
