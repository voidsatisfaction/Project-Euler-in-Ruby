# Ruby 입니다.
# 주어진 식을 :: 골드바흐 수 = 소수 + 2*제곱수 => 골드바흐 수 - 2 * 제곱수 = 소수 로 변형하였습니다.

# variables

# functions
def prime?(num)
  2.upto(num**(1.0/2.0)){ |d|
    if num % d === 0
      return false
    end
  }
  return true
end

def next_composite_num(candidate) # you can find composite number by index
  while 1
    candidate += 2
    2.upto(candidate**1.0/2.0){ |d|
      if candidate % d === 0
        return candidate
      end
    }
  end
end

def find_wrong
  candidate = 7
  while 1
    k = 1
    candidate = next_composite_num(candidate)
    square_num = 2 * k**2
    while candidate - square_num > 0
      if prime?(candidate - square_num)
        break
      end

      k += 1
      square_num = 2 * k**2

      if candidate - square_num < 0
        return candidate
      end
    end
  end
end

# main

p find_wrong
