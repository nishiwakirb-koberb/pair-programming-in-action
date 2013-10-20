require 'rspec'
require 'seating'

describe Seating do
  specify { expect(Seating.new('1:A').result).to eq 'A' }
  specify { expect(Seating.new('1:Aa').result).to eq '-' }
  specify { expect(Seating.new('2:AB').result).to eq 'AB' }
  specify { expect(Seating.new('2:AaB').result).to eq 'B-' }
  specify { expect(Seating.new('2:AZa').result).to eq '-Z' }
  specify { expect(Seating.new('2:AZz').result).to eq 'A-' }
  specify { expect(Seating.new('3:ABC').result).to eq 'ACB' }
  specify { expect(Seating.new('3:ABCa').result).to eq '-CB' }
  specify { expect(Seating.new('4:ABCD').result).to eq 'ADBC' }
  specify { expect(Seating.new('4:ABCbBD').result).to eq 'ABDC' }
  specify { expect(Seating.new('4:ABCDabcA').result).to eq '-D-A' }
end
