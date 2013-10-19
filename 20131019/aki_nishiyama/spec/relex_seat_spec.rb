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
  end
end
