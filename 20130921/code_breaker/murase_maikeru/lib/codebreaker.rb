module Codebreaker

  class Game

    def initialize
    end

    def start(secret)
      @secret = secret
    end

    def judge(guess)
      result = ""
      guess.split(//).each_with_index do |c, i|
        if @secret[i] == c
          result = "+"
        elsif @secret.include? c
          result = "-"
        end
      end
      result
    end
  end
end
