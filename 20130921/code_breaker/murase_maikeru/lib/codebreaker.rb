module Codebreaker

  class Game

    def initialize
    end

    def start(secret)
      @secret = secret
    end

    def judge(guess)
      result = ""
      guess.each_char do |c|
        if @secret.include? c
          result = "-"
        end
      end
      result
    end
  end
end
