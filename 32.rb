# variables
pan_digital = (1..9).to_a
pan_set = Array.new
all_c = Array.new
sum = 0

# functions
def overlapped?(num_array)
  checker = Array.new
  num_array.each do |x|
    checker << x.to_s.split('')
  end
  checker = checker.flatten
  if checker.length === checker.uniq.length
    return false
  else
    return true
  end
end

def pan_digital?(num_array)
  pan_digital = (1..9).to_a
  checker = Array.new
  num_array.each do |x|
    checker << x.to_s.split('')
  end
  checker = checker.flatten.sort.map{|x| x.to_i }
  if pan_digital === checker
    return true
  else
    return false
  end
end

# main
1.upto(99){|a|
  if a < 10
    1234.upto(9876){|b|
      candidates = Array.new
      candidates << a
      candidates << b
      if overlapped?(candidates)
        next
      else
        c = a * b
        candidates << c
        if !overlapped?(candidates) && pan_digital?(candidates)
          pan_set << [a,b,c]
        end
      end
    }
  else
    123.upto(987){|b|
      candidates = Array.new
      candidates << a
      candidates << b
      if overlapped?(candidates)
        next
      else
        c = a * b
        candidates << c
        if !overlapped?(candidates) && pan_digital?(candidates)
          pan_set << [a,b,c]
        end
      end
    }
  end
}

pan_set.each do |ele|
  all_c << ele[2]
end

all_c.uniq.each do |c|
  sum += c
end

p sum