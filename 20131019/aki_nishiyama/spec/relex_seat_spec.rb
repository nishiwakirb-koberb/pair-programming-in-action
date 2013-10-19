#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-
#
require './relax_seat'

describe RelaxSeat, "" do
  before do
  end

  it "should" do
    expect( RelaxSeat.new( "1:" ).to_s ).to  eq( "-" )
    expect( RelaxSeat.new( "1:A" ).to_s ).to eq( "A" )
    expect( RelaxSeat.new( "1:Aa" ).to_s ).to eq( "-" )
  end

  describe "#split_token" do
    it "split" do
      expect( RelaxSeat.new( "1:" ).split_token("1:") ).to  eq( ["1", []] )
      expect( RelaxSeat.new( "2:A" ).split_token("2:A") ).to  eq( ["2", ["A"]] )
      expect( RelaxSeat.new( "2:Aa" ).split_token("2:Aa") ).to  eq( ["2", ["A","a"]] )
    end
  end
end
