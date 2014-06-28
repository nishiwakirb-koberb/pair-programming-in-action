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
    it do
      subject.insert(10)
      expect(subject.amount).to eq 10
    end

  end

end
