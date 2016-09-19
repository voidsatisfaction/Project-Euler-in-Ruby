# Ruby 입니다.
=begin
Explanation
먼저 2진수로 나타내었을 때 끝자리가 반드시 1이 되어야 하므로,
우리가 알아봐야하는 수는 2의 배수가 되어선 안됩니다.
그리고 2진수를 구하는 함수와 숫자가 대칭인지 알아보는 함수를 새로 정의하였습니다.

=end

# variables
symmeric_num = Array.new
sum = 0

# functions
def get_binary(num)
  num_binary = Array.new
  until num === 1
    num_binary << num % 2
    num /= 2
  end
  num_binary << 1
  return num_binary.join('').reverse.to_i
end

def check_symmeric?(num)
  value = false
  if num === num.to_s.reverse.to_i
    value = true
  end
  return value
end

# main

1.upto(10**6){|num|
  if num % 2 != 0 && check_symmeric?(num) && check_symmeric?(get_binary(num))
    symmeric_num << num
  end
}

symmeric_num.each do |x|
  sum += x
end

p sum