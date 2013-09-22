class CodeBreaker
  def initialize(secret)
    @secret = secret
  end
  
  def guess(answer)
    secret_chars, answer_chars = [@secret, answer].map{|code| to_code_chars(code)}
    %w(zip + product -).each_slice(2) do |test_params|
      exec_test(secret_chars, answer_chars, *test_params)
    end
    answer_chars.map(&:mark).sort.join
  end

  private

  def exec_test(chars, other_chars, collection_method_name, mark_char)
    chars.send(collection_method_name, other_chars) do |char, other_char|
      char.test_match(other_char, mark_char)
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
