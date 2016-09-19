# Ruby입니다.
=begin
  1) 4자리 숫자의 소수의 경우의 수를 모두 구합니다.
  2) 큰 수부부터 지정해서 하나씩 내려갑니다.
  3) 두번재 수는 첫번째 수의 permutation 조건을 만족하며, 1000보다 작지 않고, 소수이며, 같은 수가 아닌 수를 지정합니다
  4) 마지막 수는 첫번째 수와 두번째 수를 뺀 공차로 구합니다. 그리고 마지막수가 소수이며, permutation조건을 만족하는지를 판정합니다.
  5) 조건을 모두 만족시키는 수를 배열에 담습니다.
=end

# setting
require 'Prime'

# variables

# functions
def find_ans
  answer_set = Array.new
  primes = primes_until_10000.reverse
  primes.each do |last|
    possibility = last.to_s.split('').permutation(4).to_a.map{ |ele| ele.join.to_i }.delete_if{ |ele| ele < 1000 || !Prime.prime?(ele) || ele === last }.uniq
    middle_candidates = possibility
    middle_candidates.each do |middle|
      d = last - middle
      first = middle - d
      if Prime.prime?(first) && possibility.include?(first)
        answer_set << first ; answer_set << middle ; answer_set << last
        return answer_set
      end
    end
  end
end

def primes_until_10000
  nums = (2..10**4).to_a
  2.upto(Math.sqrt(10**4)){ |div|
    nums.delete_if { |ele| ele % div === 0 && ele != div }
  }
  nums.delete_if { |ele| ele < 1000 }
end

# main

p find_ans.join.to_i
