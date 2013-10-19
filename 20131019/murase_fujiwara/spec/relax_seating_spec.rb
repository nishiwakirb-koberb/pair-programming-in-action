require 'rspec'
require File.join(File.dirname(__FILE__), '../src/relax_seating')

describe "relax_seating" do

  it "returns a String" do
    relax_seating("1:A").should be_a(String)
  end

  it "size of the  is the number of seats" do
    relax_seating("4:A").size.should eq 4
  end

  it "1:A" do
    relax_seating("1:A").should eq "A"
  end
  
  it "1:Aa" do
    relax_seating("1:Aa").should eq "-"
  end

  it "2:AB" do
    relax_seating("2:AB").should eq "AB"
  end
  
  it "2:AaB" do
    relax_seating("2:AaB").should eq "B-"
  end
  
  it "2:AZa" do
    relax_seating("2:AZa").should eq "-Z"
  end
  
  it "2:AZz" do
    relax_seating("2:AZz").should eq "A-"
  end

  it "3:ABC" do
    relax_seating("3:ABC").should eq "ACB"
  end

  it "3:ABCa" do
    relax_seating("3:ABCa").should eq "-CB"
  end

  it "4:ABCD" do
    relax_seating("4:ABCD").should eq "ADBC"
  end

  it "4:ABCbBD" do
    relax_seating("4:ABCbBD").should eq "ABDC"
  end

  it "4:ABCDabcA" do
    relax_seating("4:ABCDabcA").should eq "-D-A"
  end

  it "5:NEXUS" do
    relax_seating("5:NEXUS").should eq "NUESX"
  end

  it "5:ZYQMyqY" do
    relax_seating("5:ZYQMyqY").should eq "ZM-Y-"
  end

  it "5:ABCDbdXYc" do
    relax_seating("5:ABCDbdXYc").should eq "AYX--"
  end
  
  it "6:FUTSAL" do
    relax_seating("6:FUTSAL").should eq "FAULTS"
  end
  
  it "6:ABCDEbcBC" do
    relax_seating("6:ABCDEbcBC").should eq "AECB-D"
  end
  
  it "7:FMTOWNS" do
    relax_seating("7:FMTOWNS").should eq "FWMNTSO"
  end
  
  it "7:ABCDEFGabcdfXYZ" do
    relax_seating("7:ABCDEFGabcdfXYZ").should eq "YE-X-GZ"
  end
  
  it "10:ABCDEFGHIF" do
    relax_seating("10:ABCDEFGHIJ").should eq "AGBHCIDJEF"
  end
end
