class Seating
  attr_reader :result
  def initialize input
    seat_count, in_out_record = input.split(':')
    seats = Array.new(seat_count.to_i, '-')
    in_out_record.each_char do |record|
      if record.upcase == record
        first_empty_seat_index = seats.index '-'
        seats[first_empty_seat_index.to_i] = record
      else
        seat_index = seats.index record.upcase
        seats[seat_index] = '-'
      end
    end
    @result = seats.join
  end
end
