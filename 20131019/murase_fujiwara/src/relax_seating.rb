REGEX_ARRAY = [/(?<=-)-(?=-)/, /(?<=-)-(?=\w)|(?<=\w)-(?=-)/, /(?<=\w)-(?=\w)/]

def replace(seats, c)
  virtual_seats = "-#{seats}-"
  
  REGEX_ARRAY.map{|r| virtual_seats.sub(r, c) }.find{|s| s != virtual_seats}[1...-1]
end

def relax_seating(input)
  num, sequence = input.split(':')

  sequence.each_char.inject("-" * num.to_i) {|seats, c|
    c.upcase == c ? replace(seats, c) : seats.sub(c.upcase, '-')
  }
end
