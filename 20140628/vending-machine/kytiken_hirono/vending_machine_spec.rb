require 'rspec'
require './vending_machine'

def item(name, price, stock)
  VendingMachine::ItemInformation.new(name, price, stock)
end

def insert(vm, *coins)
  coins.each {|coin| vm.insert coin}
end

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

  context "Step 3" do
    let(:vm) { VendingMachine.new }
    shared_context 'when stock is not enough', stock: :not_enough do
      before do
        5.times do
          vm.insert 500
          vm.purchase('コーラ')
          vm.purchase('レッドブル')
          vm.purchase('水')
        end
        vm.refund
      end
    end
    describe '#can_purchase?' do
      context 'when stock is enough' do
        it 'returns false until some money are inserted.' do
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
        end
        it 'returns true after enough money are inserted.' do
          vm.insert 50
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
          vm.insert 50
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be true
          vm.insert 10
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be true
          vm.insert 10
          expect(vm.can_purchase?('コーラ')).to be true
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be true
          insert vm, 10, 10, 50
          expect(vm.can_purchase?('コーラ')).to be true
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be true
          vm.insert 10
          expect(vm.can_purchase?('コーラ')).to be true
          expect(vm.can_purchase?('レッドブル')).to be true
          expect(vm.can_purchase?('水')).to be true
        end
        it 'returns false after refund.' do
          vm.insert 500
          vm.refund
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
        end
      end
      context 'when stock of cola is not enough' do
        before do
          vm.insert 1000
          5.times { vm.purchase('コーラ') }
          vm.refund
        end
        it 'returns false for cola independent from inserted amount.' do
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
          vm.insert 100
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be true
          vm.insert 100
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be true
          expect(vm.can_purchase?('水')).to be true
        end
      end
      context 'when stock is not enough', stock: :not_enough do
        it 'returns false independent from inserted amount.' do
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
          vm.insert 100
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
          vm.insert 100
          expect(vm.can_purchase?('コーラ')).to be false
          expect(vm.can_purchase?('レッドブル')).to be false
          expect(vm.can_purchase?('水')).to be false
        end
      end
    end
    describe '#purchase' do
      shared_examples_for 'when it succeeded to purchase' do |name|
        it 'returns drink' do
          expect(vm.purchase(name)).to be_truthy
        end
        it 'increase sale amount' do
          expect{vm.purchase(name)}.to change{vm.sale_amount}.by(vm.items.find{|item| item.name == name}.price)
        end
        it 'decrease stock' do
          expect{vm.purchase(name)}.to change{vm.items.find{|item| item.name == name}.stock}
        end
      end
      shared_examples_for 'when it failed to purchase' do |name|
        it 'makes no change on the vending machine' do
          expect(vm.purchase(name)).to be_nil
          expect{vm.purchase(name)}.not_to change{vm.sale_amount}
          expect{vm.purchase(name)}.not_to change{vm.items.find{|item| item.name == name}.stock}
        end
      end
      context 'when stock is enough' do
        context 'until some money are inserted' do
          it_should_behave_like 'when it failed to purchase', 'コーラ'
          it_should_behave_like 'when it failed to purchase', 'レッドブル'
          it_should_behave_like 'when it failed to purchase', '水'
        end
        context 'until enough money are inserted' do
          it_should_behave_like 'when it failed to purchase', 'コーラ' do
            before { insert vm, 100, 10 }
          end
          it_should_behave_like 'when it failed to purchase', 'レッドブル' do
            before { insert vm, 100, 50, 10, 10, 10 }
          end
          it_should_behave_like 'when it failed to purchase', '水' do
            before { insert vm, 50, 10, 10, 10 }
          end
        end
        context 'enough money are inserted' do
          it_should_behave_like 'when it succeeded to purchase', 'コーラ' do
            before { insert vm, 100, 10, 10 }
          end
          it_should_behave_like 'when it succeeded to purchase', 'レッドブル' do
            before { insert vm, 100, 100 }
          end
          it_should_behave_like 'when it succeeded to purchase', '水' do
            before { vm.insert 100 }
          end
        end
        it 'returns nothing after refund.' do
          vm.insert 500
          vm.refund
          expect(vm.purchase('コーラ')).to be_nil
        end
      end
      context 'when stock is not enough', stock: :not_enough do
        context 'until some money are inserted' do
          it_should_behave_like 'when it failed to purchase', 'コーラ'
          it_should_behave_like 'when it failed to purchase', 'レッドブル'
          it_should_behave_like 'when it failed to purchase', '水'
        end
        context 'until enough money are inserted' do
          it_should_behave_like 'when it failed to purchase', 'コーラ' do
            before { insert vm, 100, 10 }
          end
          it_should_behave_like 'when it failed to purchase', 'レッドブル' do
            before { insert vm, 100, 50, 10, 10, 10 }
          end
          it_should_behave_like 'when it failed to purchase', '水' do
            before { insert vm, 50, 10, 10, 10 }
          end
        end
        context 'enough money are inserted' do
          it_should_behave_like 'when it failed to purchase', 'コーラ' do
            before { insert vm, 100, 10, 10 }
          end
          it_should_behave_like 'when it failed to purchase', 'レッドブル' do
            before { insert vm, 100, 100 }
          end
          it_should_behave_like 'when it failed to purchase', '水' do
            before { vm.insert 100 }
          end
        end
      end
    end
    describe '#sale_amount' do
      it 'returns 0 on init.' do
        expect(vm.sale_amount).to eq(0)
      end
      it 'returns sum of sold juice.' do
        expect(vm.sale_amount).to eq(0)
        vm.insert 1000
        vm.purchase('コーラ')
        expect(vm.sale_amount).to eq(120)
        vm.purchase('コーラ')
        vm.purchase('コーラ')
        vm.purchase('コーラ')
        vm.purchase('コーラ')
        expect(vm.sale_amount).to eq(120*5)
      end
    end
  end

  context "Step 4" do
    let(:vm) { VendingMachine.new }
    it "returns information of the stock" do
      [ ['コーラ', 120, 5],
        ['水', 100, 5],
        ['レッドブル', 200, 5] ].each do |expecting|
        expect(vm.items).to include(item(*expecting))
      end
    end
  end
end