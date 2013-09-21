class CodeChar
  attr_reader :char
  attr_accessor :found

  def initialize(char)
    @char = char
    @found = false
  end

  def are_you_there?(code_char)
    if not self.found? and not code_char.found? and self.char == code_char.char
      @found = true
      code_char.found = true
    end
  end

  def found?
    @found
  end
end

class CodeBreaker
  def initialize(answer_code)
    @answer_chars = to_code_chars(answer_code)
  end
  
  def guess(code)
    ''.tap do |mark|
      to_code_chars(code).each_with_index {|code_char, index|
        mark << '+' if @answer_chars[index].are_you_there?(code_char)
      }.product(@answer_chars) {|code_and_answer|
        code_char, answer_char = code_and_answer
        mark << '-' if answer_char.are_you_there?(code_char)
      }
    end
  end

  private

  def to_code_chars(code)
    code.to_s.split('').map{|char| CodeChar.new(char) }
  end
end
