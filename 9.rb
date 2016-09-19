# variables
set_array = Array.new

# functions

# main

for a in 1..333
  for b in (a+1)..499
    if (1000-a)*(1000-b) === 500000
      set_array << [a,b]
    end
  end
end

a = set_array[0][0]
b = set_array[0][1]
c = 1000-a-b
answer = a * b * c

if a**2 + b**2 === c**2
  puts "a = #{a}\nb = #{b}\nc = #{c}\nYour answer is correct!\na * b * c = #{answer}"
else
  puts "you should try again!"
end