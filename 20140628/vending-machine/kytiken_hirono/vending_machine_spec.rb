require 'rspec'
require './vending_machine'

describe VendingMachine do
  context "Step 0" do
    it "returns 10 for inserting 10 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 10
      expect(vm.paid_amount).to eq(10)
    end
    it "returns 50 for inserting 50 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 50
      expect(vm.paid_amount).to eq(50)
    end
    it "returns 100 for inserting 100 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 100
      expect(vm.paid_amount).to eq(100)
    end
    it "returns 500 for inserting 500 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 500
      expect(vm.paid_amount).to eq(500)
    end
    it "returns 1000 for inserting 1000 yen bill" do
      vm = VendingMachine.new
      vm.payment_insert 1000
      expect(vm.paid_amount).to eq(1000)
    end
    it "returns 2000 for inserting 1000 yen bills" do
      vm = VendingMachine.new
      vm.payment_insert 1000
      vm.payment_insert 1000
      expect(vm.paid_amount).to eq(2000)
    end
    it "refunds 150 for inserting 100 yen coin and 50 yen coin" do
      vm = VendingMachine.new
      vm.payment_insert 100
      vm.payment_insert 50
      expect(vm.refund).to eq(150)
      expect(vm.refund).to eq(0)
      expect(vm.paid_amount).to eq(0)
    end
  end
end
