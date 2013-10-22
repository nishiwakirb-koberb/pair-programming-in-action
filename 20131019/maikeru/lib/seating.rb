class Seating
  UNOCCUPIED = '-'.freeze

  def initialize input
    @seat_count, @seating_record = input.split(':')
  end

  def result
    @seats = (UNOCCUPIED * @seat_count.to_i).chars

    @seating_record.each_char do |record|
      is_entry_record?(record) ? occupy_seat(record) : vacate_seat(record)
    end

    @seats.join
  end

  private

  def is_entry_record? string
    string.upcase == string
  end

  def occupy_seat occupant
    best_available_seat.sub!(UNOCCUPIED, occupant)
  end

  def best_available_seat
    [UNOCCUPIED, *@seats, UNOCCUPIED].each_cons(3).max_by {|left, center, right|
      center == UNOCCUPIED ? [left, right].count {|seat| seat == UNOCCUPIED } : -1
    }[1]
  end

  def vacate_seat occupant
    @seats.find {|seat| seat == occupant.upcase }.sub!(/./, UNOCCUPIED)
  end
end
