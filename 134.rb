# Ruby 입니다.
=begin
  가장 먼저 1부터 10**6+3 까지의 모든 소수의 배열을 구합니다.(10**6까지인 이유는 그래야지 p1이 10**6이하인 모든 소수를 포함할 수 있기 때문입니다.)

  그 배열에서 p1, p2를 선택해나가며 최소인 n 즉 s를 계산해나갑니다.

  최소인 n을 계산할때는 p2 * n 의 마지막자리 몇자리수 = p1 이렇게 되어야하는데
  이는 p1의 1의자리수부터 10의 자리수 100의자리수 ... 이런식으로 거꾸로 구해주면 됩니다.

  예를들어, p1 = 999979, p2 = 999983라고 하면
  n 의 1의자리수 = 9 따라서, p2 * i 에서의 i의 1의자리수는 3*3 = 9이므로 3이 되어야합니다.
  n 의 10의자리수 = 7 따라서, p2 * i 에서의 i의 10의자리수는 3*9 = 27(7 mod 10)이므로 9가 되어야합니다.
  ....
  
  위의 행위를 여러번 반복하면 결국 최소인 n을 구할 수 있게됩니다.(그것이 least_n함수)
  저는 재귀함수를 이용하였습니다.

  Took 2.37secs
=end

require 'prime'

class Problem134
  def self.find_ans
    primes = primes_until(10**6+3)
    i = 0; s = 0
    while primes[i] < 10**6
      p1, p2 = primes[i], primes[i+1]
      s += least_n(0,p1,p2,0)
      i += 1
    end
    s
  end

  def self.least_n(n,p1,p2,sum)
    return sum if sum % 10**(p1.to_s.length) === p1
    sum_last = (sum / 10**n) % 10
    p2_last = p2 % 10
    p1_last = (p1 / 10**n) % 10
    i = 0
    until (p2_last * i + sum_last) % 10 === p1_last
      i += 1
    end
    sum += p2 * i * 10**n
    n += 1
    least_n(n,p1,p2,sum)
  end

  def self.primes_until(n)
    primes = []
    5.upto(n){ |i| primes.push(i) if i.prime? }
    primes
  end
end

start = Time.now
p Problem134.find_ans
p Time.now - start
