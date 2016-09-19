# explanation
=begin
  10**(n-1) <= a**n < 10**n 가 주어진 조건이므로 그것에 맞추어서 범위를 정합니다.
  1) 1 <= a <= 9
  2) 10**(n-1) <= a**n < 10**n 이 범위를 만족하면 count를 세줍니다.
  3) 답을 출력해줍니다.
=end

# setting

class Problem63
  def self.find_ans
    count = 0
    1.upto(9){ |a|
      n = 1
      while a**n >= 10**(n-1)
        count += 1 if a**n < 10**n
        n+=1
      end
    }
    count
  end
end

p Problem63.find_ans