# variables
n = 100

# function
def sum_mul(n)
  sum = 0
  1.upto(n) do |num|
    sum += num
  end
  sum_mul = sum ** 2
  return sum_mul
end

def mul_sum(n)
  sum = 0
  1.upto(n) do |num|
    sum += num**2
  end
  return sum
end

# main
sum_mul = sum_mul(n)
mul_sum = mul_sum(n)

answer = sum_mul - mul_sum

puts "The answer is #{answer}"

