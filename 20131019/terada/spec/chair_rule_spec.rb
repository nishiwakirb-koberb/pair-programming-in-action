require 'chair_rule'

describe ChairRule do
  specify{ expect(ChairRule.new('6:ABCabc').result).to eq '------' }
  specify{ expect(ChairRule.new('1:A').result).to eq 'A' }
  specify{ expect(ChairRule.new('1:Aa').result).to eq '-' }
  specify{ expect(ChairRule.new('2:AB').result).to eq 'AB' }
  specify{ expect(ChairRule.new('2:AaB').result).to eq 'B-' }
  specify{ expect(ChairRule.new('2:AZa').result).to eq '-Z' }
  specify{ expect(ChairRule.new('2:AZz').result).to eq 'A-' }
  specify{ expect(ChairRule.new('3:ABC').result).to eq 'ACB' }
  specify{ expect(ChairRule.new('3:ABCa').result).to eq '-CB' }
  specify{ expect(ChairRule.new('4:ABCD').result).to eq 'ADBC' }
  specify{ expect(ChairRule.new('4:ABCbBD').result).to eq 'ABDC' }
  specify{ expect(ChairRule.new('4:ABCDabcA').result).to eq '-D-A' }
  specify{ expect(ChairRule.new('5:NEXUS').result).to eq 'NUESX' }
  specify{ expect(ChairRule.new('5:ZYQMyqY').result).to eq 'ZM-Y-' }
  specify{ expect(ChairRule.new('5:ABCDbdXYc').result).to eq 'AYX--' }
  specify{ expect(ChairRule.new('6:FUTSAL').result).to eq 'FAULTS' }
  specify{ expect(ChairRule.new('6:ABCDEbcBC').result).to eq 'AECB-D' }
  specify{ expect(ChairRule.new('7:FMTOWNS').result).to eq 'FWMNTSO' }
  specify{ expect(ChairRule.new('7:ABCDEFGabcdfXYZ').result).to eq 'YE-X-GZ' }
  specify{ expect(ChairRule.new('10:ABCDEFGHIJ').result).to eq 'AGBHCIDJEF' }
  # specify{ expect(ChairRule.new('6:NABEbBZn').result).to eq '-ZAB-E' }
end