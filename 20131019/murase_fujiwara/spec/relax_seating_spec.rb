require 'rspec'
require File.join(File.dirname(__FILE__), '../src/relax_seating')

describe "relax_seating" do

  it "returns a String" do
    output = relax_seating("1:A")
    output.should be_a(String)
  end

  it "size of the output is the number of seats" do
    output = relax_seating("4:A")
    output.size.should eq 4
    # output.should have(4).items
  end
  
  it "1:A" do
    output = relax_seating("1:A")
    output.should eq "A"
  end
  
  it "1:Aa" do
    output = relax_seating("1:Aa")
    output.should eq "-"
  end

  it "2:AB" do
    output  = relax_seating("2:AB")
    output.should eq "AB"
  end
  
  it "2:AaB" do
    output = relax_seating("2:AaB")
    output.should eq "B-"
  end
  
  it "2:AZa" do
    output = relax_seating("2:AZa")
    output.should eq "-Z"
  end
  
  it "2:AZz" do
    output = relax_seating("2:AZz")
    output.should eq "A-"
  end

  it "3:ABC" do
    output = relax_seating("3:ABC")
    output.should eq "ACB"
  end

  it "3:ABCa" do
    output = relax_seating("3:ABCa")
    output.should eq "-CB"
  end

  it "4:ABCD" do
    output = relax_seating("4:ABCD")
    output.should eq "ADBC"
  end

  it "4:ABCbBD" do
    output = relax_seating("4:ABCbBD")
    output.should eq "ABDC"
  end

  it "4:ABCDabcA" do
    output = relax_seating("4:ABCDabcA")
    output.should eq "-D-A"
  end

  it "5:NEXUS" do
    output = relax_seating("5:NEXUS")
    output.should eq "NUESX"
  end

  it "5:ZYQMyqY" do
    output = relax_seating("5:ZYQMyqY")
    output.should eq "ZM-Y-"
  end

  it "5:ABCDbdXYc" do
    output = relax_seating("5:ABCDbdXYc")
    output.should eq "AYX--"
  end
  
  it "6:FUTSAL" do
    output = relax_seating("6:FUTSAL")
    output.should eq "FAULTS"
  end
  
  it "6:ABCDEbcBC" do
    output = relax_seating("6:ABCDEbcBC")
    output.should eq "AECB-D"
  end
end
