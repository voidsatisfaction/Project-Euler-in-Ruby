# varibles
num_array = Array.new
final_array = Array.new
# functions
=begin
def mul_devide(num)
  k = 1
  dividen = Array.new
  while k <= num
    if num % k === 0 && k != 1
      num = num/k
      dividen << k
      if k > num
        break
      end
    k = k - 1
    end
    k = k + 1
  end
  return dividen
end

# main

1.upto(20) do |n|
  num_array << mul_devide(n)
end

i = 0
while i <= 19
  final_array = final_array | num_array[i]
  i += 1
end
p final_array
=end


l = 20
k = 1

while k <= 20
  if l % k != 0
    l += 1
    k = 1
  end
k += 1
end

p l
