class CodeBreaker
  def initialize(answer)
    @answer = answer
  end
  
  def guess(code)
    answer_chars = @answer.to_s.split('')
    code_chars = code.to_s.split('')
    
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
