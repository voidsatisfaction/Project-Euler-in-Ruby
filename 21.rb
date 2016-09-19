# variables
shin_sum = 0

# functions
def divisor(n)
  div_array = Array.new
  for k in 1..n
    if n % k === 0
      div_array << k
    end
  end
  return div_array
end

def shinwa(n)
  sum = 0
  divisor(n).each do |l|
    sum += l
  end
  return sum-n
end

# main

2.upto(10000){|a|
  b = shinwa(a)
  if shinwa(a) === b && shinwa(b) === a && a != b
    shin_sum += a
    p a
  end
}

p shin_sum