# variables
p_list = Array.new

# functions
def find_prime(n)
  list = Array(2..n)
  prime_list = Array.new
  k = prime_list.length
  count = 1

  while count <= 10001
    prime_list << list[0]
    if prime_list.length > k then
      k = prime_list.length
      list = list - list.select {|item| item % list[0] === 0}
      count += 1
    end
  end

  return prime_list[10000]
end

# main

p "Welcome to visit my prime number find program!"
p "Find 10001 term of prime number (I recommend n == 1000000)"
print "n : "
n = gets.to_i

p "The answer is #{find_prime(n)}"
