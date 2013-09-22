class CodeBreaker
  def initialize(answer_code)
    @answer_code = answer_code
  end
  
  def guess(code)
    test_match(*test_exact_match(to_code_chars(@answer_code), to_code_chars(code))).first.map(&:mark).sort.join
  end

  private

  def test_exact_match(answer_chars, code_chars)
    exec_test(answer_chars, code_chars, :zip, :test_exact_match)
  end

  def test_match(answer_chars, code_chars)
    exec_test(answer_chars, code_chars, :product, :test_match)
  end

  def exec_test(answer_chars, code_chars, collection_method_name, test_method_name)
    answer_chars.send(collection_method_name, code_chars) do |answer_char, code_char|
      answer_char.send(test_method_name, code_char)
    end
    [answer_chars, code_chars]
  end

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
      self.mark == ''
    end
  end
end
