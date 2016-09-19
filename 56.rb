# variables
king = 0
sum_k = 0

# functions

# main

for a in 1..99
  for b in 1..99
    sum_c = 0
    challenger = a**b
    change = challenger.to_s.split('')
    change.each do |n|
      n = n.to_i
      sum_c += n
    end
    if sum_c > sum_k
      king = challenger
      sum_k = sum_c
    end
  end
end

p sum_k