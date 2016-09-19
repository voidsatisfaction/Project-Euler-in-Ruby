# Ruby입니다.
=begin
  a(n)을 'n개의 칸을 블록으로 채우는 총 경우의 수'라고 합니다.
  # 또한, n개의 칸에 우리는 3개짜리 블록을 무조건 하나 넣는 경우를 생각합니다.

  가장 먼저 맨 처음 칸에 넣는경우에는 나머지 칸을 채우는 경우의 수가 a(n-4) (왜냐하면 한칸이 띄어져 있어야 하기 때문입니다.)
  그 다음칸을 채우는 경우의 수는 a(n-5)
  그 다다음칸을 채우는 경우의 수는 a(n-6) ...
  마지막은 a(0)이고 여기서 조심해야 할 부분은, a(0)이 뒤에 칸이 '한 칸' 남아있는 것이라는 겁니다.
  그렇기 때문에 전부다 채워주는 경우의 수 1을 또 더해야 하죠.

  # 이번엔 n개의 칸에 4개짜리 블록을 무조건 하나 넣는 경우를 생각합니다.

  가장 처음칸을 채우는 경우의 수는 a(n-5)
  ....

  이런식으로 하면
  a(n) = 1*a(n-4) + 2*a(n-5) + ... + (n-2)*a(0) + 1 이렇게 되는데 (n >= 3)
  a(n)에서 a(n-1)을 빼주면
  a(n) - a(n-1) = a(n-4) + a(n-3) + ... + a(0) + 1 이 식을 도출할 수 있습니다.

  그리고 a(0) = a(1) = a(2) = 1임이 자명하므로 a(50)을 구하는 것이 어렵지 않습니다.
  아래는 위의 식에서 a(n)을 구하는 코드입니다.

  Took 0.0002sec
=end

class Problem114
  def self.number_of_cases(num)
    cases = [1,1,1] # a0 a1 a2

    3.upto(num) do |n|
      next_num = 0
      (n-4).downto(0) do |i|
        next_num += cases[i]
      end
      next_num = next_num + cases[-1] + 1
      cases.push(next_num)
    end
    cases
  end
end

start = Time.now
p Problem114.number_of_cases(50)[-1]
p Time.now - start
