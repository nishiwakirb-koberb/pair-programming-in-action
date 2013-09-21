require 'spec_helper'

describe CodeBreaker do
  it 'is true' do
    expect(CodeBreaker.hello).to be_true
  end
  
  describe '#answer' do
    before do 
      @code_breaker = CodeBreaker.new(1234)
    end
    it 'returns 1234' do
      expect(@code_breaker.answer).to eq 1234
    end
  end
	
	describe '#guess' do
		before do
			@code_breaker = CodeBreaker.new(1234)
		end
		context 'no matches' do
			it 'returns nothing' do
				expect(@code_breaker.guess(5555)).to eq ''
			end
		end
		context '1 number correct' do
			it 'returns one mark' do
				expect(@code_breaker.guess(1555)).to eq '+'
			end
		end
	end
	
end
