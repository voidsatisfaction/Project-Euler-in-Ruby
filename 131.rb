# Ruby

=begin
  let n^3 + n^2*p = (n+k)^3
  make it simple, n^2*p = 3*k*n^2 + 3*k^2*n + k**3

  if n <= k, as n, p, k is all integers, k = n*l
  n^2*p = 3*l*n^3 + 3*l^2*n^3 + l^3*n^3
  p = nl(3 + 3*l + l^2)
  as p is a prime n and l should be a 1
  n = k = 1
  p = 7

  if n > k, n = k*l
  k^2l^2p = 3k(kl)^2 + 3k^2(kl) + k^3
  l^2p = 3kl^2 + 3kl + k
  Therefore, p = 3k + 3k/l + k/l^2
  as p is a prime, k = a*l^2, p = 3al^2 + 3al + a = a(3l^2 + 3l + 1)
  so, a = 1 p = 3l^2 + 3l + 1

  Based on this fact, we can find all primes satisfing 3l^2 +3l + 1 under one million including p = 7.
=end

require 'prime'

class Problem131
  def self.find_ans
    i = 1; cache = []
    loop do
      value = 3*i**2 + i*3 + 1
      break if value > 10**6
      cache.push(value) if value.prime?
      i += 1
    end
    cache.length
  end
end

p Problem131.find_ans
