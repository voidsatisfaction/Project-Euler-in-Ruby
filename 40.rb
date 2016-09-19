=begin
굳이 소수로 생각 할 필요는 없다.
그냥 1부터 계속 나열했을 때, 무엇이 몇번째에 오는 지만 생각하면 된다.
=end

num_array = []
i = 0

while i <= 1000000
  num_array << i
  i += 1
end

num = num_array.join

p num[1].to_i * num[10].to_i * num[100].to_i * num[1000].to_i * num[10000].to_i * num[100000].to_i * num[1000000].to_i

