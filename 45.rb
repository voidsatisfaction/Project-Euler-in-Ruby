# Ruby 입니다.
=begin
  수학적으로 계산량을 줄였습니다.
  먼저, 육각수와 삼각수의 관계를 봅니다. (육각수를 삼각수의 식으로 나타내봅니다.)
  H(n+1/2) = T(n) >> 이는 n이 홀수인 경우 :: 이 경우에는 모든 육각수는 전부 삼각수가 됩니다.
  H(n/2) = T(n) - n >> 이는 n이 짝수인 경우 :: 이 경우에는 어떠한 육각수도 삼각수가 될 수 없습니다.
  따라서 우리가 고려해야 할 것은 n이 홀수인 경우이고, 그 이후에는 삼각수의 항을 늘려가면서 그것이 오각수인지만 판단해주면 됩니다.
=end

# variables

# functions
def find_ans
  i = 285 + 2
  while true
    samgaksu = i * (i+1) / 2
    if is_ogaksu?(samgaksu)
      return samgaksu
    end
    i += 2
  end
end

def is_ogaksu?(num)
  exp = (1 + Math.sqrt(24*num + 1))/6
  return exp === exp.to_i
end

# main
p find_ans