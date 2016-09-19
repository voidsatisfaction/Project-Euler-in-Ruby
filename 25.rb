# variables
fibbo = Array.new(2,1)

# functions
def prime_more_least(num,fibbo)
  i = 0
  while 1
    value = fibbo[i] + fibbo[i+1]
    fibbo << value
    if value > num
      break
    end
    i += 1
  end
  return fibbo
end


# main

p prime_more_least(10**999,fibbo).length