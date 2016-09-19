# Ruby 입니다.
=begin
  69번 문제에 푼 함수들을 그대로 썼습니다. 순열 조건 :: 각 자리숫자를 정렬하면 결국 같다 :: 만 추가했습니다.
  그래서 그런지 시간이 정~말 많이 걸렸습니다. 다른 발상을 생각 안해본건 아닌데 생각이 안떠오르더라구요 ㅠ ㅠ
  이 코드는 매우 비추천합니다.
=end

# setting
require 'prime'

class Problem69
  def self.find_ans
    king = 10**7 ; ans = 0
    2.upto(10**7-1) do |n|
      pi = phi(n)
      if n.to_s.split('').sort === pi.to_s.split('').sort
        challenger = n.to_f/pi
        king, ans = challenger, n if challenger < king
      end
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