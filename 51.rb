# Ruby 입니다.
=begin
  치환이 되어야 하는 숫자의 개수에 착안합니다.
  1. 8개의 소수 집합이 나오기 위해서는 3의 배수개가 치환되어야만 합니다. (수가 3의 배수가 되는 경우의 판정을 생각하면 됩니다.)
  2. 3의 배수개의 수가 겹치는 수 (ex)560002 0이 3의 배수개 있죠)그리고 그 겹치는 수는 최소의 수에서 확장하는 것을 고려했을 때, 반드시 0,1,2여야만 합니다.
  3. 위의 조건을 만족하는 수를 찾으면 그 수에 대해서 반복되는 부분에 1씩 더해가서 각각의 수가 prime인 경우 cnt를 1씩증가시켜주어 그 cnt가 8 인 수를 찾으면 ok 입니다.
  처리시간 : 0.3sec
  이 문제를 드디어 푸네요 ㅠㅠ
=end

require 'prime'

class Problem51
  def self.find_ans
    n = 1
    loop do
      check = check_num(n)
      return n if check and (check === 8)
      n += 1
    end
  end

  def self.check_num(num)
    y = num
    num_0 = 0 ; num_1 = 0 ; num_2 = 0
    target_nums = [] # There could be more than one number three-divisible digit
    storage = []
    cnt = 0

    until y === 0
      case y % 10
      when 0
        num_0 += 1
      when 1
        num_1 += 1
      when 2
        num_2 += 1
      end
      y /= 10
    end

    target_nums << 0 if (num_0 % 3 === 0 and num_0 != 0)
    target_nums << 1 if (num_1 % 3 === 0 and num_1 != 0)
    target_nums << 2 if (num_2 % 3 === 0 and num_2 != 0)

    return false if target_nums.empty?

    target = num.to_s.split('').map{ |e| e.to_i }
    target_nums.each do |target_num| # Becuase there could be lots of changing num ex) 221211
      0.upto((9-target_num)) do |plus|
        result = 0
        target.each do |e|
           if e === target_num
             result = result * 10 + (e + plus)
           else
             result = result * 10 + e
           end
        end
        cnt += 1 if result.prime?
      end
    end

    cnt
  end
end

start = Time.now
p Problem51.find_ans
p Time.now - start
