require 'vending_machine'

describe 'VendingMachine' do
  let(:machine) { VendingMachine.new }
  context '#new' do
    it { expect(machine.total).to eq 0 }
  end

  context '#insert' do
    it 'insert 10 yen' do
      machine.insert 10
      expect(machine.total).to eq 10
    end

    it 'insert 2 times' do
      machine.insert 10
      machine.insert 10
      expect(machine.total).to eq 20
    end

    context '#refund' do
      before { machine.insert 10 }
      let(:refund) { machine.refund }

      it 'clear' do
        refund
        expect(machine.total).to eq 0
      end

      it 'payback' do
        expect(refund).to eq 10
      end
    end

    context '#currency_check' do
      it ('invalid'){ expect(machine.currency_check(1)).to eq 1 }

      it 'valid' do
        machine.currency_check(10)
        expect(machine.total).to eq 10
      end
    end
  end
end
