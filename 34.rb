# variables
num_array = Array.new
n = 10
change = n.to_s.split('')

# functions

def factorial(n)
  fac = 1
  for k in 1..n
    fac *= k
  end
  return fac
end

# main

until factorial(9) * change.length < 10**(change.length-1)
  sum = 0
  change = n.to_s.split('')
  change.each do |k|
    k = k.to_i
    sum += factorial(k)
  end
  if sum === n
    p n
    num_array << n
  end

  n += 1
end