=begin
  I cannot solve in this way, beacause it takes too long time to solve this problem.
  I should change the method.
=end

# variables

# functions
def prime?(num)
  2.upto(num**(1.0/2.0)){ |d|
    if num % d === 0
      return false
    end
  }
  return true
end

def find_wrong
  k = 0
  candidate = 7
  while 1
    candidate = next_composite_num(candidate)
    prime_under_num(candidate).each do |prime|
      if Math.sqrt((candidate - prime) / 2) - Math.sqrt((candidate - prime) / 2).to_i === 0.0
        break
      end
      if prime === prime_under_num(candidate)[-1]
        return candidate
      end
    end
    k += 1
  end
end

def next_composite_num(candidate) # you can find composite number by index
  while 1
    candidate += 2
    2.upto(candidate**1.0/2.0){ |d|
      if candidate % d === 0
        return candidate
      end
    }
  end
end

def prime_under_num(num)
  prime_array = Array.new
  plate = (1..num).to_a
  2.upto(num-1){ |n|
    if prime?(n)
      prime_array << n
    end
  }
  return prime_array
end

# main
p find_wrong