# Ruby 입니다.
=begin
  **피보나치수의 뒷 9자리수만 계산하는 경우와 실제의 피보나치항을 계산하는 경우의 수를 나누어서 문제를 접근합니다.
  뒷 자리의 수가 팬디지털인 경우 앞부분이 팬디지털인지 확인 합니다.
=end

class Problem104
  def self.find_ans
    cnt = 2
    before_num = 1 ; next_num = 1
    l_before_num = 1 ; l_next_num = 1

    while 1
      p cnt
      next_num,before_num = next_num + before_num, next_num
      l_next_num,l_before_num = (l_next_num + l_before_num) % 10**9, l_next_num

      cnt += 1
      return cnt if pandigital?(l_next_num.to_s) && pandigital?(next_num.to_s[0..8])
    end

  end

  def self.pandigital?(str)
    return "123456789" === str.split('').sort.join
  end

end

p Problem104.find_ans