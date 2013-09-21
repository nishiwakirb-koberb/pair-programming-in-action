require 'rspec'
require 'codebreaker'

describe CodeBreaker do
  let(:codebreaker) { CodeBreaker.new }
  describe '.guess' do
    let(:code) { 1234 }
    context "when guess no match" do
      it { expect(codebreaker.guess(5555)).to be_empty }
    end

    context "when 1 number and position correct" do
      it { expect(codebreaker.guess(1555)).to eq "+" }
    end

    context "when 2 number and position correct" do
      it { expect(codebreaker.guess(1255)).to eq "++" }
    end

    context "when 1 number correct" do
      it { expect(codebreaker.guess(5155)).to eq "-" }
    end

    context "when 2 numbers correct" do
      it { expect(codebreaker.guess(5154)).to eq "+-" }
    end

    context "when matches with duplicates" do
      it { expect(codebreaker.guess(5115)).to eq "-" }
    end
  end
end