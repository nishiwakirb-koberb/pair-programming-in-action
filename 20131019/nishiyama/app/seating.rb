# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

class ChairRecommender

  def self.calc_sides(lhr)
    regex_arr = [/[-#]/, /-/, /[-#]/]
    lhr[1] == "-" ? lhr.zip(regex_arr).count{|c, r| c =~ r} : 0
  end

  def self.calc_levels(chairs)
    left, center, right = ["#" + chairs[0...-1], chairs, chairs[1..-1] + "#"].map(&:chars)
    left.zip(center, right).map(&method(:calc_sides))
  end

  def self.best_index(chairs)
    levels = self.calc_levels(chairs)
    levels.find_index{|level| level == levels.max}
  end

end


class Seating

  def initialize(chair_count,people)
    @chairs = "-" * chair_count
    @people = people.chars
  end

  def self.init_and_go(input)
    chair_count, people = input.split(':')
    self.new(chair_count.to_i, people).seating()
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
