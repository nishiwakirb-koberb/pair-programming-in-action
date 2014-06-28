# -*- coding: utf-8 -*-

require_relative '../spec_helper.rb'
require_relative '../../lib/vending_machine.rb'

describe VendingMachine do

  describe "#insert" do
    subject { VendingMachine.new }

    # 10円玉、50円玉、100円玉、500円玉、1000円札
    it { expect(subject.insert(10)).to   eq 0 }
    it { expect(subject.insert(50)).to   eq 0 }
    it { expect(subject.insert(100)).to  eq 0 }
    it { expect(subject.insert(500)).to  eq 0 }
    it { expect(subject.insert(1000)).to eq 0 }
  end

  describe "#amount" do
    subject { VendingMachine.new }

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
    subject { VendingMachine.new }

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
