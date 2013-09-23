class CodeBreaker
  def initialize(secret)
    @secret = secret
  end
  

  def guess(guess)
    mark = []

    secret, guess = *[@secret.to_s.to_a, guess.to_s.to_a].transpose.reject {|s, g| mark >> '+' if s == g }.transpose || [], []
    secret.each {|c| mark << '-' if guess.delete_first c }

    mark.join
  end
end

class Array
  def >>(o)
    self.unshift o
  end

  def delete_first(o)
    self.delete_at(self.index(o)) if self.index(o)
  end
end

class String
  def to_a
    self.split ''
  end
end
