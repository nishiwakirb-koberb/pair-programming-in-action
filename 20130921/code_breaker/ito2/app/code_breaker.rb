class CodeBreaker
  def initialize(secret)
    @secret = secret
  end
  
  def guess(answer)
    [@secret, answer].map(&method(:to_code_chars)).
      tap(&method(:exec_tests)).first.map(&:mark).sort.join
  end

  private

  def to_code_chars(code)
    code.to_s.chars.map {|char| CodeChar.new(char) }
  end

  def exec_tests((chars, other_chars))
    %w(zip + product -).each_slice(2) {|method_name, mark_char|
      chars.send(method_name, other_chars) {|char, other_char|
        char.test_match(other_char, mark_char) } }
  end

  class CodeChar
    attr_reader :char
    attr_accessor :mark

    def initialize(char)
      @char = char
      @mark = ''
    end

    def test_match(other, mark_char)
      self.mark = other.mark = mark_char if can_be_pair?(other)
    end

    def not_marked_yet?
      self.mark.empty?
    end

    private

    def can_be_pair?(other)
      self.char == other.char && [self, other].both?(&:not_marked_yet?)
    end
  end
end

class Array
  alias_method :both?, :all?
end
