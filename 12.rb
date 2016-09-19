# variables
num = 0
n = 1

# functions

# main
until num >= 500
  num = 0
  divisor = Array.new
  tri = n * (n+1) / 2
  for k in 1..(Math.sqrt(tri))
    if tri % k === 0
      divisor << k
      divisor << tri / k
    end
  end
  num = divisor.sort.length
  n += 1
end

puts tri