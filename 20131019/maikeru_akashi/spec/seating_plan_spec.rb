require 'rspec'
require 'seating_plan'

describe SeatingPlan do
  context 'when input 1:A' do
    let(:seating_plan) { SeatingPlan.new('1:A') }
    it { seating_plan.output.should eq 'A' }
  end

  context 'when input 1:Aa' do
    let(:seating_plan) { SeatingPlan.new('1:Aa') }
    it { seating_plan.output.should eq '-' }
  end

  context 'when input 2:AB' do
    let(:seating_plan) { SeatingPlan.new('2:AB') }
    it { seating_plan.output.should eq 'AB' }
  end
# 
#   context 'when input 2:AaB' do
#     let(:seating_plan) { SeatingPlan.new('2:AaB') }
#     it { seating_plan.output.should eq 'B-' }
#   end
# 
end
