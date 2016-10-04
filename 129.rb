require 'prime'

class Problem129
  def self.find_ans
    n = 10**6+1
    loop do
      p n
      last_digit = n % 10
      if last_digit != 5
        return n if a(n) > 10**6
      end
      n += 2
    end
    return n
  end

  def self.a(n)
    remainder = 1
    k = 1
    loop do
      return k if remainder === 0
      remainder = (remainder * 10 + 1) % n
      k += 1
    end
  end
end

p Problem129.find_ans
