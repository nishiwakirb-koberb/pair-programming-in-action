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
      end
    end
  end
