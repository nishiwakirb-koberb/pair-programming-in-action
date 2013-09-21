class CodeBreaker
  attr_reader :answer
  
  def initialize(answer)
    @answer = answer
  end
  
  def guess(code)
    answer_array = @answer.to_s.split('')
    code_array = code.to_s.split('')
    
    ret = []
    answer_array2 = []
    code_array2 = []
    code_array.each_with_index do |c, i|
      if answer_array[i] == c
        ret << '+'
      else
        answer_array2 << answer_array[i]
        code_array2 << code_array[i]
      end
    end
    
    code_array2.each_with_index do |c, i|
      if index = answer_array2.index(c)
        ret << '-'
        answer_array2.delete_at(index)
      end
    end
    ret.sort.join
  end
end
