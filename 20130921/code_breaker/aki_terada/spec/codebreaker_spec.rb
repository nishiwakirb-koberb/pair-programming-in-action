require 'rspec'
require 'codebreaker'

describe CodeBreaker do
  let(:codebreaker) { CodeBreaker.new }
  describe '.guess' do

    context "normal" do
    
      let(:code) { 1234 }
      let(:guess) { codebreaker.guess(value) }

      context "when guess no match" do
        let(:value) { 5555 }
        it { expect(guess).to be_empty }
      end

      context "when 1 number correct" do
        context "and position" do
          let(:value) { 1555 }
          it { expect(guess).to eq "+" }
        end

        context "include only" do
          let(:value) { 2555 }
          it { expect(guess).to eq "-" }
        end
      end

      context "when 2 number and position correct" do
        let(:value) { 1255 }
        it { expect(guess).to eq "++" }
      end

      context "when 1 number correct" do
        let(:value) { 5155 }
        it { expect(guess).to eq "-" }
      end

      context "when 2 numbers correct" do
        let(:value) { 5154 }
        it { expect(guess).to eq "+-" }
      end

      context "when matches with duplicates" do
        let(:value) { 5115 }
        it { expect(guess).to eq "-" }
      end

      context "when matches with duplicates" do
        let(:value) { 1155 }
        it { expect(guess).to eq "+" }
      end

      context "when matches with duplicates" do
        let(:value) { 5115 }
        it { expect(guess).to eq "-" }
      end
    end
    
    context "other code" do
      let(:code) { 1134 }
      let(:guess) { codebreaker.guess(value) }
      context "when matches with duplicates" do
        let(:value) { 1155 }
        it { expect(guess).to eq "++" }
      end
    end
  end
end