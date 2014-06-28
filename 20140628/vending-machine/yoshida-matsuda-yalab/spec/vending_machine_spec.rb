require './spec_helper'

RSpec.describe VendingMachine do

  it "10円玉を投入できる" do
    answer = true
    expect(VendingMachine.new().input(10)).to eq answer
  end


end