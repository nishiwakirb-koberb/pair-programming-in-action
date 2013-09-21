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
end
