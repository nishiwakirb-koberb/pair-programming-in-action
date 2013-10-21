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
    best_available_seat.occupant = occupant
  end

  def best_available_seat
    first_seat_with_empty_neighbour_count(2) ||
      first_seat_with_empty_neighbour_count(1) ||
      first_seat_with_empty_neighbour_count(0)
  end

  def first_seat_with_empty_neighbour_count count
    virtual_seats = [Seat.new, *@seats, Seat.new]
    virtual_seats.each_cons(3).find do |left_seat, center_seat, right_seat|
      empty_count = [left_seat, right_seat].count(&:unoccupied?)

      return center_seat if center_seat.unoccupied? && empty_count == count
    end
  end

  def vacate_seat occupant
    @seats.find do |seat|
      seat.occupant == occupant.upcase
    end.vacate!
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
