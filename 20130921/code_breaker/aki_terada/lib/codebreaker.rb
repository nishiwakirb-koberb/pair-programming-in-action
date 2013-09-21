class CodeBreaker
  def initialize code
    @code = code
  end

  def guess value
    ret = ''
    codes = @code.to_s.split ''
    values = value.to_s.split ''

    values.each_with_index do |v, i|
      if v == codes[i]
        ret << '+'
        codes[i] = nil
        values[i] = nil
      end
    end

    values.compact.each do |v|
      if codes.index(v)
        ret << '-'
        codes[codes.index(v)] = nil
      end
    end
    ret
  end
end