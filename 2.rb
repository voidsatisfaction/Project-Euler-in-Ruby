# variables
a = 1
b = 2
c = 0
sum = 2
array = [1,2]
# functions

# main
while c <= 4000000
  c = a + b
  if a < b
    a = c
  else
    b = c
  end
  if c % 2 === 0
    sum += c
    p sum
  end
  array << c
end

p array