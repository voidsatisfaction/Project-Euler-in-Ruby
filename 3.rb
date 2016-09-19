# varibles
dividen = Array.new
num = 600851475143
# functions

# main

for k in 2..num
  if num % k === 0
    num = num/k
    dividen << k
    if k > num
      break
    end
    k = 2
  end
end


p dividen.reverse[0]