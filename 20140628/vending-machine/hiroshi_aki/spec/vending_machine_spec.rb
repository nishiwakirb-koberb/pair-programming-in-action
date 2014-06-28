require 'vending_machine'

describe 'VendingMachine' do
  let(:machine) { VendingMachine.new }
  context '#new' do
    it { expect(machine.total).to eq 0 }
  end
end
