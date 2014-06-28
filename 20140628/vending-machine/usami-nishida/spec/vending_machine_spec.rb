require 'spec_helper'

describe VendingMachine do
  let(:machine) { VendingMachine.new }

  shared_examples_for "insert n yen coin" do |coin|
    specify do
      machine.insert(coin)
    end
  end

  it_behaves_like "insert n yen coin", 10
  include_examples "insert n yen coin", 50
  include_examples "insert n yen coin", 100
  include_examples "insert n yen coin", 500
  include_examples "insert n yen coin", 1000

  specify "get total" do
    machine.insert(10)
    machine.insert(100)
    expect(machine.amount).to eq(110)
  end

  specify "refund" do
    machine.insert(50)
    machine.insert(100)
    expect(machine.refund).to eq(150)
  end

end
