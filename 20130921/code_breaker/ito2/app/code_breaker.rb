class CodeBreaker
  def initialize(secret)
    @secret = secret
  end
  
  def guess(answer)
    to_code_chars = Proc.new{|code| code.to_s.chars.map{|char| CodeChar.new(char) } }

    exec_tests = Proc.new{|chars, other_chars|
      %w(zip + product -).each_slice(2){|method_name, mark_char|
        chars.send(method_name, other_chars){|char, other_char|
          char.test_match(other_char, mark_char)
        }
      }
    }

    [@secret, answer].map(&to_code_chars).tap(&exec_tests).first.map(&:mark).sort.join
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

    private

    def can_be_pair?(other)
      [self, other].map(&:mark).all?(&:empty?) and self.char == other.char
    end
  end
end
