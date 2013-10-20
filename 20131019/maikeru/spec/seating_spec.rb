require 'rspec'
require 'seating'

describe Seating do
  specify { expect(Seating.new('1:A').result).to eq 'A' }
  specify { expect(Seating.new('1:Aa').result).to eq '-' }
  specify { expect(Seating.new('1:AB').result).to eq 'AB' }
end
