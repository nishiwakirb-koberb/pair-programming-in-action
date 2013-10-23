# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

class ChairRecommender

  def self.calc_sides(lhr)
    lhr[1] == "-" ? lhr.zip([/[-#]/, /-/, /[-#]/]).count{|c, r| c =~ r} : 0
  end

  def self.levels(chairs)
    arr = chairs.chars.to_a # to_a is not required in Ruby 2.0
    left_arr    = [ "#" ] + arr[0...-1]
    center_arr  =           arr
    right_arr   =           arr[1..-1] + [ "#" ]

    left_arr.zip(center_arr, right_arr).map(&method(:calc_sides))
  end

  def self.best_index(chairs)
    arr = self.levels(chairs)
    max_level = arr.sort.reverse.first
    index = 0
    arr.map.with_index {|x,i|
      if max_level == x
        index = i
        break
      end
    }
    index
  end

end


class Seating

  def self.init_and_go(input)
    chair_count, people = input.split(':')
    self.new(chair_count.to_i, people).seating()
  end

  def initialize(chair_count,people)
    @chairs = "-" * chair_count
    @people = people.chars
  end

  def seating()
    @people.each_with_object(@chairs) {|person, chairs|
      if person =~ /[A-Z]/
        index = ChairRecommender.best_index(chairs)
        chairs[index] = person
      else
        chairs.sub!(person.upcase, "-")
      end
    }
  end

end


