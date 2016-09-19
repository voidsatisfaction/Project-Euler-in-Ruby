# variables
king = 1

# functions
def prime?(num)
  2.upto(num**1.0/2.0){|div|
    if num % div === 0
      return false
    end
  }
  return true
end

def pandigital?(num)
  num_array = num.to_s.split('')
  if num_array.include? '0' or num_array.include? '9' or num_array.include? '8'
    return false
  elsif num_array.length === num_array.uniq.length
    return true
  else
    return false
  end
end

# main
(8*10**6-1).downto(1){|num|
  if pandigital?(num) && prime?(num)
    king = num
    break
  end
}

p king