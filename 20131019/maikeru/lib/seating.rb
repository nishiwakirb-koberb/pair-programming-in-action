require 'pry'
require 'pry-nav'

class Seating
  attr_reader :result
  def initialize input
    @seat_count, seating_record = input.split(':')
    @seats = Array.new(@seat_count.to_i) { Seat.new }

    seating_record.each_char do |record|
      if is_entry_record? record
        occupy_seat record
      else
        vacate_seat record
      end
    end
    @result = @seats.map { |seat| seat.occupant }.join
  end

  private

  def occupy_seat occupant
    seat = best_available_seat
    seat.occupant = occupant
  end

  def best_available_seat
    seat ||= matching_seat do |left, right|
      left && right
    end
    seat ||= matching_seat do |left, right|
      left
    end
    seat ||= matching_seat do |left, right|
      left
    end
    seat ||= matching_seat do |left, right|
      right
    end
    seat ||= matching_seat do |left, right| 
      true
    end
    return seat
  end

  def matching_seat
    virtual_seats = [Seat.new] + @seats + [Seat.new]
    virtual_seats.each_cons(3) do |seat_block|
      left_unoccupied = seat_block[0].unoccupied?
      middle_unoccupied = seat_block[1].unoccupied?
      right_unoccupied = seat_block[2].unoccupied?

      next unless middle_unoccupied

      return seat_block[1] if yield left_unoccupied, right_unoccupied
    end
  end

  def vacate_seat occupant
    seat_to_vacate = @seats.find do |seat|
      seat.occupant == occupant.upcase
    end
    seat_to_vacate.vacate!
  end

  def is_entry_record? string
    string.upcase == string
  end
end

class Seat
  attr_accessor :occupant
  def initialize
    vacate!
  end

  def unoccupied?
    @occupant == '-'
  end

  def vacate!
    @occupant = '-'
  end
end
