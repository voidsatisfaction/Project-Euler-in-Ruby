# Ruby 입니다. prime library 에 있는, prime_division()이라는 함수가 정말 유용하네요.

# setting
require 'prime'

# variables

# functions
def find_answer
  n = 2 * 3 * 5 * 7
  while true
    if is_4different_divisons?(n) && is_4different_divisons?(n+1) && is_4different_divisons?(n+2) && is_4different_divisons?(n+3)
      return n
    end
    n += 1
  end
end

def is_4different_divisons?(num)
  return true if Prime.prime_division(num).length === 4
  return false
end

# main

p find_answer