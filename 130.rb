require 'prime'

class Problem129
  def self.find_ans
    cache = []
    i = 91
    loop do
      if i%5!=0 and !i.prime? and (i-1) % a(i) === 0
        cache.push(i)
        return cache.reduce(:+) if cache.length === 25
      end
      i += 2
    end
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
