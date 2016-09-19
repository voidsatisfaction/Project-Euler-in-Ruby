# Ruby 입니다. 대각선 오른쪽 위의 숫자들 / 박스의 길이가 1, 3, 5 씩 늘어나는 것에 주목하여 문제를 해결하였습니다.
# 하나의 박스에서 오른쪽 위, 왼쪽 위, 왼쪽 아래, 오른쪽 아래의 대각선을 각각 구하였습니다.

# variables
sum = 1 # 1 is alerady updated.

# functions

# main

(2..501).each do |n|
  right_upper = (2*n - 1)**2
  left_upper = right_upper - 2*(n-1)
  left_down = left_upper - 2*(n-1)
  right_down = left_down - 2*(n-1)
  sum += right_upper + left_upper + left_down + right_down
end

p sum