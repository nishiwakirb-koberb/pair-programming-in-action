module Codebreaker

  class Game

    def initialize
    end

    def start(secret)
      @secret = secret
    end

    def judge(guess)

      not_matched_guess, not_matched_secret = remove_exact_match_chars(guess, @secret)
      result = "+" * (guess.size - not_matched_guess.size)

      not_matched_guess.split(//).each_with_index do |c,i|
        if not_matched_secret.include? c
          not_matched_secret.sub!(c, "")
          result += "-"
        end
      end

      sort_result(result)
    end

    def remove_exact_match_chars(str1, str2)
      removed1 = ""
      removed2 = ""
      str1.split(//).each_with_index do |c, i|
        unless str2[i] == c
          removed1 += c
          removed2 += str2[i]
        end
      end
      [removed1, removed2]
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
