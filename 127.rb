require 'prime'

class Problem127
  def self.find_ans
    c_sum = 0; limit = 120000
    rads = (1..limit).to_a.map{ |n| rad(n) }.unshift(0)
    3.upto(limit) do |c|
      next if rads[c] > c/2
      (c/2).downto(1) do |a|
        rada = rads[a]; radb = rads[c-a]; radc = rads[c]
        c_sum += c if coprime?(radc,rada) && (c/radc > rada * radb)
      end
    end
    c_sum
  end

  def self.coprime?(a,b)
    return true if a.gcd(b) === 1
    return false
  end

  def self.rad(num)
    value = 1
    Prime.prime_division(num).each{ |e| value *= e.first }
    value
  end
end

start = Time.now
p Problem127.find_ans
p Time.now - start
