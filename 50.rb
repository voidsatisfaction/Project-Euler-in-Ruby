# Ruby 입니다
=begin
  1) 연속된 소수의 갯수를 section으로 두고 최대 section을 구합니다. (최대 section은 첫번째 소수인 2부터 차례로 더해가면서 10만이 넘지 않는 연속된 요소들의 배열 길이)
  2) 2부터 10만까지의 소수의 배열을 구합니다.
  3) 구한 최대 section에서 역으로 하나하나 연산해봅니다. 그리고 그 더한 값이 소수인지 확인합니다.
  4) 주어진 조건을 만족하면 출력합니다.
=end

# setting
require 'Prime'

# variables

# functions
def get_lagest_section
  primes = Array.new
  sum = 0
  i = 2
  until sum >= 10**6
    if i.prime?
      primes << i
      sum += i
    end
    i += 1
  end
  return primes.length-1
end

def get_primes
  primes = Array.new
  i = 2
  until i === 10**6
    primes << i if i.prime?
    i += 1
  end
  primes
end

def find_ans(lar_sec, primes)
  lar_sec.downto(21){ |section|
    i = 0
    until (section-1+i) === primes.length-1
      sum = 0
      for x in (i..section-1+i)
        sum += primes[x]
      end

      if sum > 10**6
        break
      elsif sum.prime? && sum < 10**6
        return sum, section
      end
      i += 1
    end
  }
end

# main

num = get_lagest_section

p find_ans(num, get_primes)