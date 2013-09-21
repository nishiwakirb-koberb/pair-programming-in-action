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
		matched_codes = answer_array & code_array
		'+' * matched_codes.size()
	end
end
