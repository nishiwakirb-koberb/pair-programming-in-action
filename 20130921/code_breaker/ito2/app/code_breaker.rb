class CodeBreaker
  def initialize(secret)
    @secret = secret
  end
  
  def guess(answer)
    [@secret, answer].
      map{|code| to_code_chars(code)}.
      tap{|secret_chars, answer_chars| exec_tests(secret_chars, answer_chars)}.
      first.map(&:mark).sort.join
  end

  private

  def exec_tests(chars, other_chars)
    %w(zip + product -).each_slice(2) do |method_name, mark_char|
      chars.send(method_name, other_chars) do |char, other_char|
        char.test_match(other_char, mark_char)
      end
    end
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

    def test_match(other, mark_char)
      if [self, other].all?(&:not_marked_yet?) and self.char == other.char
        self.mark = other.mark = mark_char
      end
    end

    def not_marked_yet?
      self.mark == ''
    end
  end
end
