require 'spec_helper'

describe CodeBreaker do
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
      specify { expect(@code_breaker.guess(5115)).to eq '-' }
      specify { expect(CodeBreaker.new(1134).guess(1155)).to eq '++' }
      specify { expect(CodeBreaker.new(1134).guess(5115)).to eq '+-' }
      specify { expect(CodeBreaker.new(1134).guess(5511)).to eq '--' }
      specify { expect(CodeBreaker.new(1134).guess(1115)).to eq '++' }
      specify { expect(CodeBreaker.new(1134).guess(5111)).to eq '+-' }
      specify { expect(CodeBreaker.new(1155).guess(1234)).to eq '+' }
      specify { expect(CodeBreaker.new(1111).guess(1112)).to eq '+++' }
      specify { expect(CodeBreaker.new(1113).guess(1121)).to eq '++-' }
      specify { expect(CodeBreaker.new(3111).guess(1311)).to eq '++--' }
      specify { expect(CodeBreaker.new(3114).guess(1251)).to eq '--' }
      specify { expect(CodeBreaker.new(1511).guess(2134)).to eq '-' }
    end
  end
  
end
