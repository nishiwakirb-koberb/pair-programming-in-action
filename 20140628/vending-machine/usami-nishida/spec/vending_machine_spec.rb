require 'vending_machine'

describe VendingMachine do

  let(:machine) { VendingMachine.new }

  specify "insert 10 yen coin" do
    machine.insert(10)
  end
  specify "insert 50 yen coin" do
    machine.insert(50)
  end
  specify "insert 100 yen coin" do
    machine.insert(100)
  end
  specify "insert 500 yen coin" do
    machine.insert(500)
  end
  specify "insert 1000 yen coin" do
    machine.insert(1000)
  end

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
