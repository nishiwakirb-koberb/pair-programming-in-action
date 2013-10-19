class RelaxSit
  def come_and_go(input)
    chair_count = input[/\d+/].to_i
    @chairs = Array.new(chair_count, "-")
    steps = input[/[a-zA-Z]+/].chars
    steps.each do |step|
      index = find_empty_chair_index
      if step =~ /[A-Z]/
        @chairs[index] = step
      else
        @chairs[index] = "-"
      end
    end
    @chairs.join
  end
  def find_empty_chair_index
    0
  end
end
