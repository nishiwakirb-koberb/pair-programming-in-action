class CodeBreaker
  def initialize(answer_code)
    @answer_chars = to_code_chars(answer_code)
  end
  
  def guess(code)
    to_code_chars(code).each_with_index {|code_char, index|
      @answer_chars[index].test_exact_match(code_char)
    }.product(@answer_chars) {|code_char, answer_char|
      answer_char.test_match(code_char)
    }.map(&:mark).sort.join
  end

  private

  def to_code_chars(code)
    code.to_s.each_char.map{|char| CodeChar.new(char) }
  end

  class CodeChar
    attr_reader :char
    attr_accessor :mark

    def initialize(char)
      @char = char
      @mark = ''
    end

    def test_exact_match(other)
      if self.char == other.char
        self.mark = other.mark = '+'
      end
    end

    def test_match(other)
      if [self, other].all?(&:not_marked_yet?) and self.char == other.char
        self.mark = other.mark = '-'
      end
    end

    def not_marked_yet?
      @mark == ''
    end
  end
end
