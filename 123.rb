# Ruby

=begin
  Analysis

  n is the n term of prime. if so,
  remainder = (Pn-1)^n + (Pn+1)^n === n*Pn*({1+[-1]^(n-1)} + {1 + [-1]^(n)}) (mod Pn^2)

  In this situation, n should be odd since the remainder is 2 if n is even.

  Based on this fact, we can get first nth prime that exceeds 10^10 by using bruteforce.

  Efficiency O(n^(3/2))
  Took 1.8sec
=end

class Problem123
  def self.find_ans
    limit = 10**10 ; i = 3 ; n = 1
    loop do
      if prime?(i)
        if n % 2 === 1
          n += 1
        else
          n += 1
          value = 2*n*i
          return n if value > limit
        end
      end
      i += 2
    end
  end

  def self.prime?(n)
    2.upto(Math.sqrt(n)){ |i| return false if n % i === 0 }
    return true
  end
end

start = Time.now
p Problem123.find_ans
p Time.now - start
