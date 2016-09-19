sum = 0
num = 2**1000
num_array = num.to_s.split('')
num_array.each do |number|
  number = number.to_i
  sum += number
  p sum
end

p sum