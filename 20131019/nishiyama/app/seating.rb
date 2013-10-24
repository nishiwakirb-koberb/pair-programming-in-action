# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

VACANT = '-'

class ChairRecommender

  def self.calc_vacant_levels(chairs)
    [VACANT + chairs[0...-1], chairs, chairs[1..-1] + VACANT].
      map(&:chars).map(&:to_a).transpose.
      map {|l, c, r| c == VACANT ? [l, c, r].count(VACANT) : 0 }
  end

  def self.best_index(chairs)
    levels = self.calc_vacant_levels(chairs)
    levels.index(levels.max)
  end

end


class Seating

  def initialize(chair_count, people)
    @chairs = VACANT * chair_count
    @people = people
  end

  def self.init_and_go(input)
    chair_count, people = input.split(':')
    self.new(chair_count.to_i, people.chars).seating()
  end

  def seating()
    @people.each {|person| person =~ /[A-Z]/ ? occupy(person) : vacate(person) }
    @chairs
  end

  private

  def occupy(person)
    index = ChairRecommender.best_index(@chairs)
    @chairs[index] = person
  end

  def vacate(person)
    @chairs.sub!(person.upcase, VACANT)
  end

end
