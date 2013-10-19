require 'pp'

def relax_seating(input)
  num, sequence = input.split(':')
  output = "-" * num.to_i
  sequence.each_char do |c|
    if c.upcase == c
      output[0] = c
    else
      output[0] = '-'
    end
  end
  output
end
