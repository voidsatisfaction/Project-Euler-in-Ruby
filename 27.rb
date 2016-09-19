# 루비 입니다.
# Explanation
=begin
  연산의 양을 줄이기 위하여 먼저, 수학적으로 식을 고찰하였습니다.
  1. n = 0 부터 시작하기 때문에 b는 반드시 소수여야만 합니다. 이는 b가 소수+양수 라는 조건을 부가합니다.
  2. 또한, n**2 + a * n + b라는 식이 소수여야 하므로, a는 반드시 홀수여야 합니다.
      이는, n이 홀수일때, 짝수일때를 생각하시면 아실 수 있습니다. b = 2 를 제외하면 b 는 전부 홀수입니다.
  저는 위의 1,2 조건을 이용하여 연산량을 줄였습니다.
=end

# variables
king = 0
answer = Array.new

# functions
def prime?(n) # 소수인지 아닌지 판별하는 함수
  if n === 1
    result = false
  else
    result = true
    for x in 2..n**(0.5)
      if n % x === 0
        result = false
        break
      end
    end
  end
  return result
end

def get_prime(n) # n까지의 소수를 전부 배열에 저장하는 함수
  prime_array = Array.new
  for k in 1..n
    if k === 1
      result = false
    else
      result = true
      for x in 2..k**(0.5)
        if k % x === 0
          result = false
          break
        end
      end
      if result === true
        prime_array << k
      end
    end
  end
  return prime_array
end

# main
b_set = get_prime(1000)
a_set = (-499..500).to_a.map{ |x| 2*x-1 }

b_set.each do |b|
  a_set.each do |a|
    n = 0
    while 1
      if (n**2 + a * n + b) > 0 && prime?(n**2 + a * n + b)
        n += 1
      elsif n >= king
        king = n
        answer[0] = a
        answer[1] = b
        answer[2] = king
        break
      else
        break
      end
    end
  end
end

p answer[0] * answer[1]
