# coding: utf-8
# Ruby 입니다. 1부터 28123까지의 전체의 수 - 두 초과수의 합 으로 구하였습니다.

# variables
exceed_array = Array.new
exceed_sum = Array.new
ans_sum = 0

# functions
def exceed_num?(num) # identify whether it is exceed number or not
  sum = 0
  divisors(num).each do |k|
    sum += k
  end
  if sum > num
    return true
  else
    return false
  end
end

def divisors(num) # functions for finding divisors
  divisors_array = Array.new
  1.upto(num**1.0/2.0){|n|
    if num % n === 0
      divisors_array << n
      divisors_array << num/n
    end
  }
  return divisors_array.uniq - [num]
end

# main

2.upto(28111){|n|
  if exceed_num?(n)
    exceed_array << n
  end
}

# add the sum of exceed numbers
for x in 0..exceed_array.length-1
  for y in 0..exceed_array.length-1
    if exceed_array[x] + exceed_array[y] <= 28123
      exceed_sum << exceed_array[x] + exceed_array[y]
    end
  end
end

exceed_sum.uniq!

((1..28123).to_a - exceed_sum).each do |ele|
  ans_sum += ele
end

p exceed_array
p ans_sum
