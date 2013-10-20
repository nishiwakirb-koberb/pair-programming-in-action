require 'rspec'
require 'seating'

describe Seating do
  specify { expect(Seating.new('1:A').result).to eq 'A' }
  specify { expect(Seating.new('1:Aa').result).to eq '-' }
  specify { expect(Seating.new('2:AB').result).to eq 'AB' }
  specify { expect(Seating.new('2:AaB').result).to eq 'B-' }
  specify { expect(Seating.new('2:AZa').result).to eq '-Z' }
  specify { expect(Seating.new('2:AZz').result).to eq 'A-' }
end
