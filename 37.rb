=begin
The number that satisfy these conditions..
front : 2,3,5,7
end : 3,7

=end

# variables
sum = 0
count = 0
n = 13
num_array = Array.new

# functions
def delete_front(num)
  num = num.to_s.split('')
  num.shift
  num = num.join('').to_i
  return num
end

def delete_rear(num)
  num = num.to_s.split('')
  num.pop
  num = num.join('').to_i
  return num
end

def prime?(num)
  value = true
  if num === 1
    value = false
  else
    for x in 2..Math.sqrt(num)
      if num % x === 0
        value = false
        break
      end
    end
  end
  return value
end

# main

while count < 11
  num = n
  front_num = num.to_s[0].to_i
  rear_num = num.to_s[-1].to_i
  if prime?(front_num) && (rear_num === 3 || rear_num === 7) && prime?(num)
    result = true
    num1 = num
    num2 = num
    until delete_front(num1) === 0 && delete_rear(num2) === 0
      num1 = delete_front(num1)
      num2 = delete_rear(num2)
      value1 = prime?(num1)
      value2 = prime?(num2)
      if value1 === false || value2 === false
        result = false
        break
      end
    end
    if result
      num_array << num
      count += 1
    end
  end
  n += 1
end

num_array.each do |num|
  sum += num
end

p num_array
p sum