class CodeBreaker
  def initialize(answer)
    @answer = answer
  end
  
  def guess(code)
    answer_array = @answer.to_s.split('')
    code_array = code.to_s.split('')
    
    mark = []
    answer_work_array = []
    code_work_array = []
    code_array.each_with_index do |c, i|
      if answer_array[i] == c
        mark << '+'
      else
        answer_work_array << answer_array[i]
        code_work_array << code_array[i]
      end
    end
    
    code_work_array.each do |c|
      if index = answer_work_array.index(c)
        mark << '-'
        answer_work_array.delete_at(index)
      end
    end
    mark.sort.join
  end
end
