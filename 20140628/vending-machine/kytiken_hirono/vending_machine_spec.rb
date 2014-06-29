require 'rspec'
require './vending_machine'

describe VendingMachine do
  context "Step 0" do
    it "returns 10 for inserting 10 yen coin" do
      vm = VendingMachine.new
      vm.insert 10
      expect(vm.paid_amount).to eq(10)
    end
    it "returns 50 for inserting 50 yen coin" do
      vm = VendingMachine.new
      vm.insert 50
      expect(vm.paid_amount).to eq(50)
    end
    it "returns 100 for inserting 100 yen coin" do
      vm = VendingMachine.new
      vm.insert 100
      expect(vm.paid_amount).to eq(100)
    end
    it "returns 500 for inserting 500 yen coin" do
      vm = VendingMachine.new
      vm.insert 500
      expect(vm.paid_amount).to eq(500)
    end
    it "returns 1000 for inserting 1000 yen bill" do
      vm = VendingMachine.new
      vm.insert 1000
      expect(vm.paid_amount).to eq(1000)
    end
    it "returns 2000 for inserting 1000 yen bills" do
      vm = VendingMachine.new
      vm.insert 1000
      vm.insert 1000
      expect(vm.paid_amount).to eq(2000)
    end
    it "refunds 150 for inserting 100 yen coin and 50 yen coin" do
      vm = VendingMachine.new
      vm.insert 100
      vm.insert 50
      expect(vm.refund).to eq(150)
      expect(vm.refund).to eq(0)
      expect(vm.paid_amount).to eq(0)
    end
  end

  context "Step 1" do
    let(:vm) { VendingMachine.new }
    [1, 5, 5000, 10000, 100000].each do |amount|
      it "returns #{amount} yen coin for inserting #{amount} yen coin" do
        expect(vm.insert amount).to eq(amount)
      end
    end
    [10, 50, 100, 500, 1000].each do |amount|
      it "returns nil coint for inserting #{amount} yen coin" do
        expect(vm.insert amount).to be_nil
      end
    end
  end

  context "Step 2" do
    let(:vm) { VendingMachine.new }
    it "returns information of the stock" do
      expect(vm.juice_name).to eq("コーラ")
      expect(vm.juice_price).to eq(120)
      expect(vm.juice_stock).to eq(5)
    end
  end

  context "Step 3" do
    let(:vm) { VendingMachine.new }
    describe '#can_purchase?' do
      context 'when stock is enough' do
        it 'returns false until some money are inserted.' do
          expect(vm.can_purchase?).to be_falsey
        end
        it 'returns true after enough money are inserted.' do
          vm.insert 100
          expect(vm.can_purchase?).to be_falsey
          vm.insert 10
          expect(vm.can_purchase?).to be_falsey
          vm.insert 10
          expect(vm.can_purchase?).to be_truthy
        end
        it 'returns false after refund.' do
          vm.insert 500
          vm.refund
          expect(vm.can_purchase?).to be_falsey
        end
      end
      context 'when stock is not enough' do
        before do
          vm.insert 1000
          5.times { vm.purchase }
        end
        it 'returns false independent from inserted amount.' do
          vm.refund
          expect(vm.can_purchase?).to be_falsey
          vm.insert 100
          expect(vm.can_purchase?).to be_falsey
          vm.insert 100
          expect(vm.can_purchase?).to be_falsey
        end
      end
    end
  end
end
