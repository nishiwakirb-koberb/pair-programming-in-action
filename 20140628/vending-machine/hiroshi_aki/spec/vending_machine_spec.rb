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

    describe 'insert invalid coin' do
      it 'refund amount 1 yen' do
        expect(machine.insert(1)).to eq 1
      end

      it 'not added 1 yen' do
        machine.insert(10)
        machine.insert(1)
        expect(machine.total).to eq 10
      end
    end
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
    describe 'valid' do
      it ('valid'){ expect(machine.currency_check(10)).to be_truthy }
    end

    describe 'invalid' do
      it ('coin 1'){ expect(machine.currency_check(1)).to be_falsey }
      it ('coin 5'){ expect(machine.currency_check(1)).to be_falsey }
      it ('coin 2000'){ expect(machine.currency_check(2000)).to be_falsey }
      it ('coin 5000'){ expect(machine.currency_check(5000)).to be_falsey }
      it ('coin 10,000'){ expect(machine.currency_check(10_000)).to be_falsey }
    end
  end

end
