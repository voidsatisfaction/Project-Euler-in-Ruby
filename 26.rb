# Ruby 입니다.
=begin
  ** 사람이 순환소수를 구하는 매커니즘을 그대로 옮겼습니다.
  a/b 의 경우 :: a를 어떤수 b 로 나눌때, 먼저 b가 a보다 크다면 a*10을해서 다시 b로 나누어보고 그것의 몫과 나머지를 quotient(circular에 저장), a로 각각 저장합니다.
  그리고 같은 경우의 계산을 a 가 중복되지 않는 선에서 계속하면 그 수의 순환고리의 길이를 구할 수 있습니다.
=end

class Problem26
  def self.find_ans
    king = [2,1] # 2, the number of circular
    2.upto(1000) do |b| # 1/b
      circular = [] ; checker = {} ; a = 1
      until checker.has_key?("#{a}") || a === 0
        checker["#{a}"] = 0
        a *= 10
        if b > a
          a *= 10 ; circular << 0
          next
        else
          quotient,a = a.divmod(b)
          circular << quotient
        end
      end
      king = [b,circular.length]  if circular.length > king[1]
    end
    king
  end
end

p Problem26.find_ans