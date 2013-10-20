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
    seat ||= seat_with_empty_neighbour_count 2
    seat ||= seat_with_empty_neighbour_count 1
    seat ||= seat_with_empty_neighbour_count 0
    return seat
  end

  def seat_with_empty_neighbour_count count
    virtual_seats = [Seat.new] + @seats + [Seat.new]
    virtual_seats.each_cons(3) do |seat_block|
      middle_unoccupied = seat_block[1].unoccupied?
      next unless middle_unoccupied

      empty_count = 0
      empty_count += seat_block[0].unoccupied? ? 1 : 0
      empty_count += seat_block[2].unoccupied? ? 1 : 0

      return seat_block[1] if empty_count == count
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
