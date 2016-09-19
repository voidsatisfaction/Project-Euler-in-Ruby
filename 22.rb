# variables

# functions

# main

f = File.open("22.txt")
f.each_line do |line|
  result = 0
  i = 1
  name = line.gsub('"','').split(',').sort
  name.each do |n|
    sum = 0
    n.each_byte do |c|
      sum += c - 64
    end
    value = sum * i
    result += value
    i += 1
  end
  p result
end
