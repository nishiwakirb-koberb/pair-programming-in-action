require 'vending_machine'

describe VendingMachine do

  let(:machine) { VendingMachine.new }

  specify "insert 10 yen coin" do
    machine.insert(10)
  end
end
