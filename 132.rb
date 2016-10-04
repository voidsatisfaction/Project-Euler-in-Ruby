require 'prime'

class Problem132
  def self.find_ans
    i = 3; cache = []
    loop do
      cache.push(i) if i.prime? and mod(10,10**9,9*i) === 1
      break if cache.length === 40
      i += 2
    end
    cache.reduce(:+)
  end

  def self.mod(a,b,i)
    if b === 0
      return 1
    elsif b.even?
      (mod(a,b/2,i)**2 % i)
    else
      ((mod(a,(b-1)/2,i)**2 * a) % i)
    end
  end
end

start = Time.now
p Problem132.find_ans
p Time.now - start
