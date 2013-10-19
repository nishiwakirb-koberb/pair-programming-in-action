require 'pp'

def relax_seating(input)
  num, sequence = input.split(':')
  output = "-" * num.to_i
  output[0] = sequence[0]
  output
end
