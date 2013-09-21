module Codebreaker

  class Game

    def initialize
    end

    def start(secret)
      @secret = secret
    end

    def judge(guess)
      result = ""
      not_matched_secret = ""
      not_matched_guess = ""

      guess.split(//).each_with_index do |c, i|
        if @secret[i] == c
          result += "+"
        else
          not_matched_secret += @secret[i]
          not_matched_guess += c
        end
      end

      not_matched_guess.split(//).each_with_index do |c,i|
        if not_matched_secret.include? c
          not_matched_secret.sub!(c, "")
          result += "-"
        end
      end

      sort_result(result)
    end

    def sort_result(str)
      order = ["+", "-"]
      sorted = str.split(//).sort_by do |c|
        order.index c
      end
      sorted.join
    end
  end
end
