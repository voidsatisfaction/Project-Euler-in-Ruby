# variables
result = 1
sum = 0

# functions

# main

1.upto(100){|n|
  result *= n
}

change = result.to_s.split('')

change.each do |n|
  n = n.to_i
  sum += n
end

p sum