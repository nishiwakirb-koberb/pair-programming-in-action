# -*- coding: utf-8 -*-

require_relative '../spec_helper.rb'
require_relative '../../lib/vending_machine.rb'

describe VendingMachine do

  subject { VendingMachine.new }

  describe "#insert" do

    # 10円玉、50円玉、100円玉、500円玉、1000円札
    it { expect(subject.insert(10)).to   eq 0 }
    it { expect(subject.insert(50)).to   eq 0 }
    it { expect(subject.insert(100)).to  eq 0 }
    it { expect(subject.insert(500)).to  eq 0 }
    it { expect(subject.insert(1000)).to eq 0 }

    # 想定外のもの（硬貨：１円玉、５円玉。お札：千円札以外のお札）
    context "with unexpected coins or bills" do
      it { expect(subject.insert(1)).to eq 1 }
      it { expect(subject.insert(5)).to eq 5 }
      it { expect(subject.insert(2000)).to eq 2000 }
      it { expect(subject.insert(10000)).to eq 10000 }
    end
  end

  describe "#amount" do

    it { expect(subject.amount).to eq 0 }
    it "gets 10, then its amount is 10" do
      subject.insert(10)
      expect(subject.amount).to eq 10
    end
    it "gets 10 twice, then its amount is 20" do
      subject.insert(10)
      subject.insert(10)
      expect(subject.amount).to eq 20
    end
    it "gets 10, 50, 100, 500, 1000, then its amount is 1660" do
      subject.insert(10)
      subject.insert(50)
      subject.insert(100)
      subject.insert(500)
      subject.insert(1000)
      expect(subject.amount).to eq 1660
    end

  end

  describe "#refund" do

    it "refunds change" do
      subject.insert 100
      subject.insert 500
      expect(subject.refund).to eq 600
    end

    it "clear amount after refund " do
      subject.insert 100
      subject.insert 500
      expect(subject.amount).to eq 600
      expect(subject.refund).to eq 600
      expect(subject.amount).to eq 0
    end
  end

end
