require './app/seating'

describe ChairRecommender do
  describe "#calc_sides" do
    it "should" do
      expect( ChairRecommender.calc_sides( "-","-","-" )).to be 3
      expect( ChairRecommender.calc_sides( "A","-","-" )).to be 2
      expect( ChairRecommender.calc_sides( "A","-","B" )).to be 1
      expect( ChairRecommender.calc_sides( "A","B","C" )).to be 0
      expect( ChairRecommender.calc_sides( "#","-","-" )).to be 3
      expect( ChairRecommender.calc_sides( "#","-","#" )).to be 3
      expect( ChairRecommender.calc_sides( "-","D","-" )).to be 0
    end
  end

  describe "#levels" do
    it "should" do
      expect( ChairRecommender.levels( "---"  )).to eq [3,3,3]
      expect( ChairRecommender.levels( "----" )).to eq [3,3,3,3]
      expect( ChairRecommender.levels( "A---" )).to eq [0,2,3,3]
      expect( ChairRecommender.levels( "A-B"  )).to eq [0,1,0]
      expect( ChairRecommender.levels( "ABC"  )).to eq [0,0,0]
    end
  end

  describe "#best_index" do
    it "should" do
      expect( ChairRecommender.best_index( "---"  )).to eq 0
      expect( ChairRecommender.best_index( "----" )).to eq 0
      expect( ChairRecommender.best_index( "A---" )).to eq 2
      expect( ChairRecommender.best_index( "A-B"  )).to eq 1
      expect( ChairRecommender.best_index( "ABC"  )).to eq 0
    end
  end
end

describe Seating do
  describe "#init_and_go" do
    it "should" do
      expect( Seating.init_and_go( "6:NABEbBZn" )).to eq "-ZAB-E"
      expect( Seating.init_and_go( "1:A" )).to eq "A"
      expect( Seating.init_and_go( "1:Aa" )).to eq "-"
      expect( Seating.init_and_go( "2:AB" )).to eq "AB"
      expect( Seating.init_and_go( "2:AaB" )).to eq "B-"
      expect( Seating.init_and_go( "2:AZa" )).to eq "-Z"
      expect( Seating.init_and_go( "2:AZz" )).to eq "A-"
      expect( Seating.init_and_go( "3:ABC" )).to eq "ACB"
      expect( Seating.init_and_go( "3:ABCa" )).to eq "-CB"
      expect( Seating.init_and_go( "4:ABCD" )).to eq "ADBC"
      expect( Seating.init_and_go( "4:ABCbBD" )).to eq "ABDC"
      expect( Seating.init_and_go( "4:ABCDabcA" )).to eq "-D-A"
      expect( Seating.init_and_go( "5:NEXUS" )).to eq "NUESX"
      expect( Seating.init_and_go( "5:ZYQMyqY" )).to eq "ZM-Y-"
      expect( Seating.init_and_go( "5:ABCDbdXYc" )).to eq "AYX--"
      expect( Seating.init_and_go( "6:FUTSAL" )).to eq "FAULTS"
      expect( Seating.init_and_go( "6:ABCDEbcBC" )).to eq "AECB-D"
      expect( Seating.init_and_go( "7:FMTOWNS" )).to eq "FWMNTSO"
      expect( Seating.init_and_go( "7:ABCDEFGabcdfXYZ" )).to eq "YE-X-GZ"
      expect( Seating.init_and_go( "10:ABCDEFGHIJ" )).to eq "AGBHCIDJEF"
    end
  end
end
