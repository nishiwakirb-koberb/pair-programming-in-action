require 'spec_helper'
require 'vending_machine'

describe VendingMachine do
  subject { VendingMachine.new }

  describe '#insert' do
    context 'when inserted valid money' do
      [10, 50, 100, 500, 1000].each do |money|
        context "when #{money} yen is inserted" do
          it 'works' do
            expect { subject.insert(money) }.not_to raise_error
          end
        end
      end
      context 'when inserted invalid money' do
        it 'returns itself' do
          expect(subject.insert(10000)).to eq 10000
        end
      end
    end
  end

  describe '#amount' do
    context 'when inserted no money' do
      it 'returns 0' do
        expect(subject.amount).to eq 0
      end
    end
    context 'when inserted 1 money' do
      before { subject.insert(10) }
      it 'returns 10' do
        expect(subject.amount).to eq 10
      end
    end
    context 'when inserted plural money' do
      before do
        subject.insert(10)
        subject.insert(50)
        subject.insert(500)
      end
      it 'returns 560' do
        expect(subject.amount).to eq 560
      end
    end
  end

  describe '#refund' do
    context 'when inserted no money' do
      it 'returns empty array' do
        expect(subject.refund).to eq []
      end
    end
    context 'when inserted 1 money' do
      before { subject.insert(10) }
      it 'returns array that contains 10' do
        expect(subject.refund).to eq [10]
      end
      it 'amount is 0' do
        subject.refund
        expect(subject.amount).to eq 0
      end
    end
    context 'when inserted plural money' do
      before do
        subject.insert(10)
        subject.insert(50)
        subject.insert(500)
      end
      it 'returns array that contains inserted conins' do
        expect(subject.refund).to eq [10, 50, 500]
      end
      it 'amount is 0' do
        subject.refund
        expect(subject.amount).to eq 0
      end
    end
  end

  describe '#juice_info' do
    context 'when initial state' do
      it 'returns 5 colas whose price is 120 yen' do
        expect(subject.juice_info).to eq [{name: 'cola', price: 120, amount: 5}]
      end
    end
  end

  describe 'can_buy?' do
    context 'when given drink name that is not stored in machine' do
      it 'returns false' do
        expect(subject.can_buy?('fanta')).to eq false
      end
    end
    context 'when given dring name that is stored in machine' do
      context 'when stock is 0' do
        it 'returns false' do
          expect(subject.can_buy?('cola')).to eq false
        end
      end
      context 'when stock is not 0' do
        context 'when have been inserted enough money' do
          before do
            subject.insert(100)
            subject.insert(100)
          end
          it 'returns true' do
            expect(subject.can_buy?('cola')).to eq true
          end
        end
        context 'when have not been inserted encoding money' do
          before { subject.insert(100) }
          it 'returns false' do
            expect(subject.can_buy?('cola')).to eq false
          end
        end
      end
    end
  end

  describe 'buy' do
    context 'when given drink name that is not stored in machine' do
      it 'returns nil' do
        expect(subject.buy('fanta')).to be_nil
      end
    end
    context 'when given dring name that is stored in machine' do
      context 'when stock is 0' do
        before do
          subject.insert(100)
          subject.insert(500)
          5.times { subject.buy('cola') }
        end
        it 'returns nil' do
          expect(subject.buy('cola')).to be_nil
        end
      end
      context 'when stock is not 0' do
        context 'when have been inserted enough money' do
          before do
            subject.insert(100)
            subject.insert(100)
          end
          it 'returns juice' do
            expected = { name: 'cola' }
            expect(subject.buy('cola')).to eq expected
          end
          context 'after bought' do
            it 'stock has decreased 1' do
              before_amount = subject.juice_info.find { |drink| drind[:name] == 'cola' }[:amount]
              subject.buy('cola')
              after_amount = subject.juice_info.find { |drink| drind[:name] == 'cola' }[:amount]
              expect(before_amount - after_amount).to eq 1
            end
          end
        end
        context 'when have not been inserted encoding money' do
          before { subject.insert(100) }
          it 'returns nil' do
            expect(subject.buy('cola')).to be_nil
          end
        end
      end
    end
  end
end
