class CodeBreaker
  def guess value
    ret = ''
    codes = ["1", "2", "3", "4"]
    values = value.to_s.split ''

    values.each_with_index do |v, i|
      if v == codes[i]
        ret << '+'
        codes[i] = nil
        values[i] = nil
      end
    end

    values.uniq!
    values.each_with_index do |v, i|
      next unless v
      if codes.index(v)
        ret << '-'
        codes[i] = nil
      end
    end
    ret
  end
end