# variables
n = 1

# functions

def num_check(num)
  i = 1
  if process(num,i) === process(num,i+1) && process(num,i+1) === process(num,i+2) && process(num,i+2) === process(num,i+3) && process(num,i+3) === process(num,i+4) && process(num,i+4) === process(num,i+5)
    return num
  end
  value = 0
end

def process(num,k) # when you multiply k and sort
  return (num * k).to_s.split('').sort
end

# main

while true
  num = num_check(n)
  if num != 0
    break
  end
  n += 1
end

p num
