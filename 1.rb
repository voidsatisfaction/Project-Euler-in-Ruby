# variables

# functions
def mul_sum(n)
  sum = 0
  num = 999/n
  for k in 1..num
    sum += n * k
  end
  return sum
end

# main

sum3 = mul_sum(3)
sum5 = mul_sum(5)
sum15 = mul_sum(15)

answer = sum3 + sum5 - sum15
p "The answer is #{answer}"