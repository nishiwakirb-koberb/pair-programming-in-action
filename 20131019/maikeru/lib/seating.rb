class Seating
  attr_reader :result
  def initialize input
    seat_count, in_out_record = input.split(':')
    @seats = Array.new(seat_count.to_i, '-')

    in_out_record.each_char do |record|
      if is_entry_record? record
        @seats[first_empty_seat_index] = record
      else
        @seats[seat_index(record)] = '-'
      end
    end
    @result = @seats.join
  end

  private

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
