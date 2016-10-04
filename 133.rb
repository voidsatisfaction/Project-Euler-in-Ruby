require 'prime'

class Problem132
  def self.find_ans
    primes = primes_until(10**5); cache = []
    primes.each do |prime|
      cache.push(prime) if !(mod(10,10**30,9*prime) === 1)
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

  def self.primes_until(n)
    primes = []
    2.upto(n){ |n| primes.push(n) if n.prime? }
    primes
  end
end

start = Time.now
p Problem132.find_ans
p Time.now - start
