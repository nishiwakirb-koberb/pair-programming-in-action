REGEX_ARRAY = [/(-)-(-)/, /(-)-(\w)|(\w)-(-)/, /(\w)-(\w)/].freeze
ESCAPE_FROM_VIRTUAL = (1...-1).freeze

def relax_seating(input)
  num, sequence = input.split(':')
  sequence.each_char.inject('-' * num.to_i) {|seats, c| c == c.upcase ? replace(seats, c) : seats.sub(c.upcase, '-') }
end

def replace(seats, c)
  virtual_seats = "-#{seats}-"
  REGEX_ARRAY.find{|r| r =~ virtual_seats}
  virtual_seats.sub( $&, "#{$1||$3}#{c}#{$2||$4}")[ESCAPE_FROM_VIRTUAL]
end
