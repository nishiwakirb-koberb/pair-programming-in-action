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
    
    ''.tap do |mark|
      3.downto(0).each do |i|
        if answer_chars[i] == code_chars[i]
          mark << '+'
          answer_chars.delete_at i
          code_chars.delete_at i
        end
      end
      
      code_chars.each do |c|
        if index = answer_chars.index(c)
          mark << '-'
          answer_chars.delete_at(index)
        end
      end
    end
  end
end
