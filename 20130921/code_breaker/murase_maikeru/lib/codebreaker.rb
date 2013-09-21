module Codebreaker

  class Game

    def initialize(secret)
      @secret = secret
    end

    def judge(guess)
      unmatched_secret, unmatched_guess = remove_exact_match_chars(@secret, guess)
      match_count = guess.size - unmatched_guess.size
      "+" * match_count + "-" * inexact_match_count(unmatched_guess, unmatched_secret)
    end

    private

    def inexact_match_count(str1, str2)
      temp = str2
      str1.split(//).count do |c|
        temp = temp.sub(c, "") if temp.include?(c)
      end
    end

    def remove_exact_match_chars(str1, str2)
      removed1 = ""
      removed2 = ""
      str1.split(//).zip(str2.split(//)).each do |c1, c2|
        unless c1 == c2
          removed1 += c1
          removed2 += c2
        end
      end
      [removed1, removed2]
    end
  end
end
