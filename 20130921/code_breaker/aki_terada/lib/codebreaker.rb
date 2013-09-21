class CodeBreaker
  def guess value
    ret = ''
    codes = ["1", "2", "3", "4"]
    values = value.to_s.split ''
    values.each_with_index do |v, i|
      ret << '+' if v == codes[i]
    end
    ret
  end
  def code
    1234.to_s.split nil
  end
end