#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-
#
require './relax_seat'

describe RelaxSeat, "" do
  it "should" do
    expect( RelaxSeat.new( "1:" ).to_s ).to  eq( "-" )
    expect( RelaxSeat.new( "1:A" ).to_s ).to eq( "A" )
    expect( RelaxSeat.new( "1:Aa" ).to_s ).to eq( "-" )
    pending( "  ... " )
    expect( RelaxSeat.new( "2:AB" ).to_s ).to eq( "AB" )
  end

  describe "#split_token" do
    it "split" do
      expect( RelaxSeat.new( "1:" ).split_token("1:") ).to  eq( ["1", []] )
      expect( RelaxSeat.new( "2:A" ).split_token("2:A") ).to  eq( ["2", ["A"]] )
      expect( RelaxSeat.new( "2:Aa" ).split_token("2:Aa") ).to  eq( ["2", ["A","a"]] )
    end
  end

  describe "#search_empty_lr" do
    it "" do
      expect( RelaxSeat.new( "1:-" ).is_empty_lr( 0 ) ).to        be_true
      expect( RelaxSeat.new( "1:--" ).is_empty_lr( 1 ) ).to       be_true
      expect( RelaxSeat.new( "1:---" ).is_empty_lr( 2 ) ).to      be_true
      expect( RelaxSeat.new( "1:-" ).search_empty_lr( ) ).to      eq( 0 )
      expect( RelaxSeat.new( "1:--" ).search_empty_lr( ) ).to     eq( 0 )
      expect( RelaxSeat.new( "1:---" ).search_empty_lr( ) ).to    eq( 0 )
    end
  end


end
