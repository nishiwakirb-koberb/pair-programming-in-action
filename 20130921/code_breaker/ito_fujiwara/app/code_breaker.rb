class CodeBreaker
  
  attr_reader :answer
  
  def self.hello
    true
  end
  
  def initialize(answer)
    @answer = answer
  end
  
  def guess(code)
    answer_array = @answer.to_s.split('')
    code_array = code.to_s.split('')
    
    ret = []
    code_array.each_with_index do |c, i|
      if answer_array.include?(c)
        if answer_array[i] == c
          ret << '+'
        else
          ret << '-'
        end
      end
    end
    ret.join
  end
end
