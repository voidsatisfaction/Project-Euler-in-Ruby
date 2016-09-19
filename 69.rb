# Ruby 입니다.
=begin
  1) 파이 함수를 구현했습니다. (오일러의 곱 공식을 참조)
  2) n/phi(n)을 구하여 최대인 수의 n을 출력합니다.
=end

# setting
require 'prime'

class Problem69
  def self.find_ans
    king = 0 ; ans = 0
    1.upto(10**6) do |n|
      challenger = n.to_f/phi(n)
      king, ans = challenger, n if challenger > king
    end
    ans
  end

  def self.phi(num)
    if num.prime?
      return num - 1
    else
      primes = Prime.prime_division(num).each{ |ele| ele.pop }.flatten

      value = 1
      primes.each do |p|
        value *= (1 - Rational(1,p))
      end
      result = (num * value).to_i
    end
  end
end

p Problem69.find_ans