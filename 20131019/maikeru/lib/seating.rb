class Seating
  def initialize input
    @seat_count, @seating_record = input.split(':')
  end

  def result
    @seats = Array.new(@seat_count.to_i) { Seat.new }

    @seating_record.each_char do |record|
      is_entry_record?(record) ? occupy_seat(record) : vacate_seat(record)
    end

    @seats.map {|seat| seat.occupant }.join
  end

  private

  def occupy_seat occupant
    best_available_seat.occupy!(occupant)
  end

  def best_available_seat
    [Seat.new, *@seats, Seat.new].each_cons(3).max_by {|left, center, right|
      center.unoccupied? ? [left, right].count(&:unoccupied?) : -1
    }[1]
  end

  def vacate_seat occupant
    @seats.find {|seat| seat.occupant == occupant.upcase }.vacate!
  end

  def is_entry_record? string
    string.upcase == string
  end
end

class Seat
  UNOCCUPIED = '-'
  attr_reader :occupant

  def initialize
    vacate!
  end

  def unoccupied?
    @occupant == UNOCCUPIED
  end

  def vacate!
    @occupant = UNOCCUPIED
  end

  def occupy!(occupant)
    @occupant = occupant
  end
end
