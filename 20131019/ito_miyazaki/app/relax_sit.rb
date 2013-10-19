class RelaxSit
  def come_and_go(input)
    chair_count = input[/\d+/].to_i
    @chairs = Array.new(chair_count, "-")
    steps = input[/[a-zA-Z]+/].chars
    steps.each do |step|
      if step =~ /[A-Z]/
        index = find_empty_chair_index
        @chairs[index] = step
      else
        index = find_sitting_chair_index(step)
        @chairs[index] = "-"
      end
    end
    @chairs.join
  end
  def find_empty_chair_index
    @chairs.index('-')
  end
  def find_sitting_chair_index(name)
    @chairs.index(name.upcase)
  end
end
