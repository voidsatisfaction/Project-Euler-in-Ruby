# Ruby 입니다.

=begin
  1) 3/7 바로 앞에 올수 있는 수의 분모는 2 ~ 10**6 까지 입니다.
  2) 각 분모에 대하여 분자는 (분모 * 3/7)의 내림 의 형태부터 따져나가기 시작합니다.
  3) 이렇게 구한 하나의 수가 기약분수가 아닐 경우에는 gcd를 이용하여 기약분수화 시킵니다.
  4) 답을 출력합니다.
=end

class Problem71
  def self.find_ans
    king = 3.0/7 - 2.0/5 ; answer = 0

    2.upto(10**6) do |deno|
      numer = (deno * (3.0/7) - 1).floor
      value = numer.to_f/deno

      if 3.0/7 - value < king
        king = 3.0/7 - value
        gcd = deno.gcd(numer.to_i)
        answer = numer/gcd
      else
        next
      end
    end
    answer
  end
end

p Problem71.find_ans