# Ruby 입니다.
=begin
  71번 문제에서 힌트를 얻었습니다.
  1) 2부터 12000까지의 모든 분모를 deno로 지정합니다
  2) 그 각각의 deno(분모)에 대하여 1/3 부터 1/2 사이의 numer(분자)를 세어줍니다.
  3) 그 사이의 진분수를 세어줍니다.
  4) 답을 출력합니다.
=end

class Problem73
  def self.find_ans
    ans = 0
    2.upto(12000) do |deno|
      ans += getCounts(deno)
    end
    ans
  end

  def self.getCounts(deno)
    counts = 0
    numer = ((deno * (1.0/3)) + 1).floor
    while Rational(numer,deno) < 0.5
      counts += 1 if deno.gcd(numer) === 1
      numer += 1
    end
    counts
  end
end

p Problem73.find_ans
