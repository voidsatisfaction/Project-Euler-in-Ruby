# variables
p_list = Array.new
sum = 0

# functions
def find_prime(n)
  list = Array(2..n)
  prime_list = Array.new
  k = prime_list.length

  while list.empty? === false
    prime_list << list[0]
    if prime_list.length > k then
      k = prime_list.length
      list = list - list.select {|item| item % list[0] === 0}
    end
  end

  return prime_list
end

# main

p "Welcome to visit my prime number find program!"
p "Find all the prime numbers until n"
print "n : "
n = gets.to_i

p_list = find_prime(n)

p p_list