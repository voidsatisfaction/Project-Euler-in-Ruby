# Ruby 입니다.

# explanation
=begin
  1) 정사각형의 크기를 level 로 나눕니다. ex) level 1 = 정사각형 크기 2*level + 1
  2) 그리고 계산속도 향상을 위하여 대각선의 primes들의 개수만 구합니다. (메모리에 저장 시키지 않습니다.)
  3) 그 비율을 추적합니다.

  여담이지만, 문제에서 '미만'이 아니고 '이하'가 아닌가요?
=end
require 'prime'

class Problem58
  def self.find_ans
    prime_ratio = 1
    level = 0
    numerator = 0
    while prime_ratio > 0.1
      level += 1
      numerator = numerator + find_primes_num(level)
      denominator = 4 * level
      prime_ratio = numerator.to_f / denominator.to_f
    end
    answer = 2 * level + 1
  end

  def self.find_primes_num(level)
    standard = (level * 2 + 1) ** 2
    candidates = Array.new
    1.upto(3){ |index|
      candidates << standard - 2*level * index
    }
    candidates.delete_if{ |ele| !ele.prime? }
    candidates.length
  end
end

p Problem58.find_ans