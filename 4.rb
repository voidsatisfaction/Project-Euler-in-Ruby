# variables
num_array = Array.new

# function

# main

for n1 in 100..999
  for n2 in 100..999
    num = n1 * n2
    s_num = num.to_s.split('')
    if s_num === s_num.reverse
      num_array << num
    end
  end
end

p num_array.sort.reverse[0]
p num_array.min