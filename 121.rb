# Ruby
=begin
  Get the all posibilities player lose(using combination)
  Then, get the winning rate of player for this game
  Get maximum prize
=end
class Problem121
  def self.find_ans
    total_lose = 0
    8.upto(15) do |lose|
      total_lose += (1..15).to_a.combination(lose).to_a.map{ |e| e.reduce(:*) }.reduce(:+)
    end
    winning_rate = 1 - Rational(total_lose,factorial(16))
    prize = (1/winning_rate).floor
  end

  def self.factorial(num)
    result = 1
    num.downto(1) do |i|
      result *= i
    end
    result
  end
end

p Problem121.find_ans
