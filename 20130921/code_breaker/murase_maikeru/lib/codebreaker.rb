module Codebreaker

  class Game

    def initialize
    end

    def start(secret)
      @secret = secret
    end

    def judge(guess)
      unmatched_secret, unmatched_guess = remove_exact_match_chars(@secret, guess)
      result = "+" * (guess.size - unmatched_guess.size)
      result += "-" * inexact_match_count(unmatched_guess, unmatched_secret)
    end

    def inexact_match_count(str1, str2)
      count = 0
      temp = str2.dup
      str1.split(//).each_with_index do |c,i|
        if temp.include? c
          temp.sub!(c, "")
          count += 1
        end
      end
      count
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
  end
end
