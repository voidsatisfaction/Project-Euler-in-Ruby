# variables

# functions
def factorial(n)
  fac = 1
  for k in 1..n
    fac *= k
  end
  return fac
end

# main
puts factorial(40)/(factorial(20)*factorial(20))

