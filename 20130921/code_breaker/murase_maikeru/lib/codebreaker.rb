module Codebreaker

  class Game

    def initialize(secret)
      @secret = secret
    end

    # def judge(guess)
    #   unmatched_secret, unmatched_guess = remove_exact_match_chars(@secret, guess)
    #   result = "+" * (guess.size - unmatched_guess.size)
    #   result += "-" * inexact_match_count(unmatched_guess, unmatched_secret)
    # end

    def judge(guess)
      num_exact_total = 0
      num_inexact_total = 0
      ("0".."9").each do |c|
        secret_indexes = []
        @secret.split(//).each_with_index do |s,idx|
          secret_indexes << idx if s == c
        end
        guess_indexes = []
        guess.split(//).each_with_index do |g, idx|
          guess_indexes << idx if g == c
        end
        num_exact = (secret_indexes & guess_indexes).count
        num_matched = secret_indexes.size > guess_indexes.size ? guess_indexes.size : secret_indexes.size
        num_inexact = num_matched - num_exact
        num_exact_total += num_exact
        num_inexact_total += num_inexact
      end

      "+" * num_exact_total + "-" * num_inexact_total
    end

    private

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
