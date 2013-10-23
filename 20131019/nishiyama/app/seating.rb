# -*- coding: utf-8 -*-
#
# 問題の説明:
#   http://nabetani.sakura.ne.jp/hena/ord7selectchair/
#   「のんびり座りたい 」 問題
#

class ChairRecommender

  def self.calc_sides(left,here,right)
    if "-" != here
      0
    else
      level = 0
      level += 1   if left.match(/[-#]/)
      level += 1   if here == "-"
      level += 1   if right.match(/[-#]/)
      level
    end
  end

  def self.levels(chairs)
    arr = chairs.split( "" )
    left_arr    = [ "#" ] + arr[0...(arr.size-1)]
    center_arr  =           arr
    right_arr   =           arr[1...(arr.size  )] + [ "#" ]

    left_arr.zip(center_arr, right_arr).map {|x|
      calc_sides(x[0],x[1],x[2])
    }
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
    @chairs = Array.new(chair_count.to_i, "-").join
    @people = people.split("")
  end

  def seating()
    @people.each {|person|
      if person.match( /[A-Z]/ )
        index = ChairRecommender.best_index(@chairs)
        @chairs[index] = person
      else
        @chairs.sub!(person.upcase, "-")
      end
    }
    @chairs
  end

end


