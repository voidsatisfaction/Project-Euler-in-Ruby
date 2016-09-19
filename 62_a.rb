# explanation
=begin
  1) find i**3 and add to array (minimum value)
  2) if sth is overlapped 5times then stop
  3) print the value
=end

# setting

# variables

# functions
def find_ans
  conditional_array = Array.new
  express_num_array = Array.new
  i = 1
  while 1
    if conditional_array.include?(find_minimum_permutation(i**3))
      index = conditional_array.index(find_minimum_permutation(i**3))
      express_num_array[index] += 1
    else
      conditional_array << i**3
      express_num_array << 1
    end
    p express_num_array
    if express_num_array.include?(5)
      return conditional_array[express_num_array.index(5)]
    end
    p conditional_array
    i += 1
  end
end

def find_minimum_permutation(num)
  return num.to_s.split('').sort.join.to_i
end
# main

p find_ans
p find_minimum_permutation(56623104)