# variables
sum = 0

# functions

# main

2.upto(2000000){|n|
  c = 0
  for k in 1..(Math.sqrt(n))
    if n % k === 0 && k != 1
      c = 1
      break
    end
  end

  if c === 0
    sum += n
  end
}

p sum