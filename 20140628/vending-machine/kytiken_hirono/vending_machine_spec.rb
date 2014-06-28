require 'rspec'
require 'vending_machine'

describe VendingMachine do
  context "Step 0" do
    it "returns 10 for inserting 10 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 10
      expect(vm.paid_amount).to eq(10)
    end
  end
end
