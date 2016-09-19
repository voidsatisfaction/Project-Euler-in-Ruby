# variables
answer = 0
n = 2
num_list = Array.new

# functions

# main

while n < 10**6
  sum = 0
  n.to_s.split('').map{ |ele| ele.to_i**5 }.each do |num|
    sum += num
  end
  if sum === n.to_i
    num_list << n.to_i
  end
  n += 1
end

num_list.each do |k|
  answer += k
end

puts answer