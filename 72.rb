# Ruby 입니다.
=begin
  1) phi함수는 69번 문제에서 구한 것을 그대로 차용합니다.
  2) phi함수를 2 ~ 10**6 까지 더해줍니다.
  3) 답을 출력합니다.
=end

require 'prime'

class Problme72
  def self.find_ans
    sum = 0
    2.upto(10**6){ |deno| sum += phi(deno) }
    sum
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

p Problme72.find_ans