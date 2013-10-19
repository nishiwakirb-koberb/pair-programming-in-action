require 'rspec'
require 'seating_plan'

describe SeatingPlan do
  context 'when input 1:A' do
    let(:seating_plan) { SeatingPlan.new('1:A') }
    it { seating_plan.output.should eq 'A' }
  end
end
