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
  specify { expect(Seating.new('5:NEXUS').result).to eq 'NUESX' }
  specify { expect(Seating.new('5:ZYQMyqY').result).to eq 'ZM-Y-' }
  specify { expect(Seating.new('5:ABCDbdXYc').result).to eq 'AYX--' }
  specify { expect(Seating.new('6:FUTSAL').result).to eq 'FAULTS' }
  specify { expect(Seating.new('6:ABCDEbcBC').result).to eq 'AECB-D' }
  specify { expect(Seating.new('7:FMTOWNS').result).to eq 'FWMNTSO' }
  specify { expect(Seating.new('7:ABCDEFGabcdfXYZ').result).to eq 'YE-X-GZ' }
end
