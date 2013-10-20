require 'rspec'
require 'seating'

describe Seating do
  specify { expect(Seating.new('1:A').result).to eq 'A' }
end
