class Seating
  attr_reader :result
  def initialize input
    seat_count, in_out_record = input.split(':')
    @seats = Array.new(seat_count.to_i, '-')

    in_out_record.each_char do |record|
      if is_entry_record? record
        occupy_seat record
      else
        vacate_seat record
      end
    end
    @result = @seats.join
  end

  private

  def occupy_seat occupant
    @seats[first_empty_seat_index] = occupant
  end

  def vacate_seat occupant
    @seats[seat_index(occupant)] = '-'
  end

  def first_empty_seat_index
    @seats.index('-').to_i
  end

  def seat_index record
    @seats.index record.upcase
  end

  def is_entry_record? string
    string.upcase == string
  end
end
