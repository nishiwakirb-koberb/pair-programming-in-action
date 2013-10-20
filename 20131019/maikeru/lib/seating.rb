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
    virtual_seats = [Seat.new] + @seats + [Seat.new]
    virtual_seats.each_cons(3) do |seat_block|
      left_unoccupied = seat_block[0].unoccupied?
      middle_unoccupied = seat_block[1].unoccupied?
      right_unoccupied = seat_block[2].unoccupied?
      both_unoccupied = left_unoccupied && right_unoccupied

      if (middle_unoccupied && both_unoccupied)
        seat_block[1].occupant = occupant
        break
      elsif (middle_unoccupied && right_unoccupied)
        seat_block[1].occupant = occupant
        break
      end
    end
  end

  def vacate_seat occupant
    seat_to_vacate = @seats.find do
      |seat| seat.occupant == occupant.upcase
    end
    seat_to_vacate.occupant = '-'
  end

  def is_entry_record? string
    string.upcase == string
  end
end

class Seat
  attr_accessor :occupant
  def initialize
    @occupant = '-'
  end

  def unoccupied?
    @occupant == '-'
  end
end
