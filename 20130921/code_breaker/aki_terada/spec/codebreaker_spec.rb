require 'rspec'
require 'codebreaker'

describe CodeBreaker do
	describe 'guess' do
		let(:code) { 1234 }
		codebreaker = CodeBreaker.new
		context "when guess no match" do
			it { expect(codebreaker.guess(5555)).to eq be_empty }
		end
	end
end