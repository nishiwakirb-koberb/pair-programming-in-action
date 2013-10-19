class SeatingPlan
  def initialize input
    @input = input
    analyze
  end

  def output
    @output
  end

  private
  def analyze
    bench_size, attendees_raw = @input.split(':')
    @output = attendees_raw
  end
end

