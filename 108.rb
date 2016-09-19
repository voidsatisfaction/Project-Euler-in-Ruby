# Ruby 입니다.
=begin
  ** 주어진 식을 알맞게 변형하면, (x-n)*(y-n) = n**2의 식이 나옵니다.
  이 식을 바탕으로, 주어진 문제는 n**2의 약수의 개수가 2000개가 넘는 최초의 n값이라는 말과 동치가 됩니다.
  여기서 약수의 개수는 주어진 수를 소인수분해하여 (지수의 + 1) * (다른 지수의 + 1) ... 이 되는데, 여기서 우리는 n**2의 약수의 개수가 알고싶으므로,
  소인수분해를 하였을 때 n의 (2*지수 + 1) * (2* 다른지수의 + 1) ... 을 해주면 됩니다.
  그리고, 3**7 > 2000 이므로, 소수가 될 수 있는 수들은 2,3,5,7,11,13,17 밖에 되지 않습니다.
=end

require 'prime'

class Problem108
  def self.find_ans
    n = 1
    while 1
      value = 1
      Prime.prime_division(n).each do |ele|
        break if ![2,3,5,7,11,13,17].include?(ele[0])
        value *= (2*ele[1] + 1)
      end
      return n if value > 2000
      n += 1
    end
  end
end

p Problem108.find_ans