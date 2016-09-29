# Ruby

=begin
  There are plenty of useful methods (tools) in Ruby such as prime_division method.

  The solution is simple.
  use dictionary with bruteforce.

  But I felt that I was somewhat cheating...
  Took 1.5sec
=end

require 'prime'

class Problem124
  def self.find_ans
    cache = {}
    1.upto(10**5) do |i|
      rad = rad(i).to_s
      cache.has_key?(rad) ? cache[rad].push(i) : cache[rad] = [i]
    end
    cache.values.flatten[9999]
  end

  def self.rad(n)
    value = 1
    Prime.prime_division(n).each{ |e| value *= e.first }
    value
  end
end

start = Time.now
p Problem124.find_ans
p Time.now - start
