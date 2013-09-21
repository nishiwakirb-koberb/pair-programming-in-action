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
    context '1 number correct and correct position' do
      it 'returns one mark' do
        expect(@code_breaker.guess(1555)).to eq '+'
      end
    end
    
    context '1 number correct and incorrect position' do
      it 'returns one mark' do
        expect(@code_breaker.guess(2555)).to eq '-'
      end
    end

    context '2 numbers correct' do
      specify { expect(@code_breaker.guess(5254)).to eq '++' }
      specify { expect(@code_breaker.guess(5154)).to eq '+-' }
      specify { expect(@code_breaker.guess(2545)).to eq '--' }
    end

    context '3 numbers correct' do
      specify { expect(@code_breaker.guess(5234)).to eq '+++' }
      specify { expect(@code_breaker.guess(5134)).to eq '++-' }
      specify { expect(@code_breaker.guess(5124)).to eq '+--' }
      specify { expect(@code_breaker.guess(5123)).to eq '---' }
    end

    context 'all numbers correct' do
      specify { expect(@code_breaker.guess(1234)).to eq '++++' }
      specify { expect(@code_breaker.guess(1243)).to eq '++--' }
      specify { expect(@code_breaker.guess(1423)).to eq '+---' }
      specify { expect(@code_breaker.guess(4321)).to eq '----' }
    end
		
		context 'matches with duplicates' do
      specify { expect(@code_breaker.guess(1155)).to eq '+' }
      end
  end
  
end
