# variables
count = 0

# functions
def factorial(n)
  fac = 1
  for k in 1..n
    fac *= k
  end
  return fac
end

# main

for n in 1..100
  for r in 0..n
    value = factorial(n)/(factorial(r) * factorial(n-r))
    if value > 1000000
      p value
      count += 1
    end
  end
end

p count