# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

VACANT = '-'

class ChairRecommender

  def self.calc_vacant_levels(chairs)
    left   =  [VACANT] + chairs
    center =  chairs
    right  =  chairs   + [VACANT]
    right.shift

    center.zip( left, right ).map { |x|
      (x[0] != VACANT) ? 0 : x.join.count(VACANT)
    }
  end

  def self.best_index(chairs)
    levels = self.calc_vacant_levels(chairs.split(''))
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
