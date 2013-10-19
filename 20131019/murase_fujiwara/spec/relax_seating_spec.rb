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
  
end
