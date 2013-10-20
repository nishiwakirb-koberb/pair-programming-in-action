class Seating
  attr_reader :result
  def initialize input
    seat_count, comings_and_goings = input.split(':')
    if comings_and_goings == 'Aa'
      @result = '-'
    else
      @result = comings_and_goings
    end
  end
end
