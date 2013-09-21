require 'rspec'
require 'codebreaker'

describe CodeBreaker do
  let(:codebreaker) { CodeBreaker.new }
  describe 'guess' do
    let(:code) { 1234 }
    context "when guess no match" do
      it { expect(codebreaker.guess(5555)).to be_empty }
    end

    context "when guess no match" do
      it { expect(codebreaker.guess(1555)).to "+" }
    end
  end
end