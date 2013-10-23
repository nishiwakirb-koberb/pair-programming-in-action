# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

class ChairRecommender

  def self.calc_sides(lcr)
    regex_arr = [/[-#]/, /-/, /[-#]/]
    lcr[1] == "-" ? lcr.zip(regex_arr).count {|char, r| char =~ r } : 0
  end

  def self.calc_levels(chairs)
    left, center, right = ["#" + chairs[0...-1], chairs, chairs[1..-1] + "#"].map(&:chars)
    left.zip(center, right).map(&method(:calc_sides))
  end

  def self.best_index(chairs)
    levels = self.calc_levels(chairs)
    levels.index(levels.max)
  end

end


class Seating

  def initialize(chair_count, people)
    @chairs = "-" * chair_count
    @people = people
  end

  def self.init_and_go(input)
    chair_count, people = input.split(':')
    self.new(chair_count.to_i, people.chars).seating()
  end

  def seating()
    @people.each_with_object(@chairs) {|person, _|
      person =~ /[A-Z]/ ? occupy(person) : vacate(person)
    }
  end

  private

  def occupy(person)
    index = ChairRecommender.best_index(@chairs)
    @chairs[index] = person
  end

  def vacate(person)
    @chairs.sub!(person.upcase, "-")
  end

end
