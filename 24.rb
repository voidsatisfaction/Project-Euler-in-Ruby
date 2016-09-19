#루비 입니다.
=begin
explanation
순열 조합을 이용해서 문제를 풀었습니다.
앞의 한 자리를 고정시키고 나머지 자릿수의 경우의 수를 팩토리얼 계산으로 해서 풀었습니다.

=end

# variables
index = 1

# functions
def factorial(n)
  value = 1
  1.upto(n){|k|
    value *= k
  }
  return value
end

def find_by_order(num)
  answer = Array.new
  nums = (0..9).to_a
  i = 0
  x = 9
  until num === 0
    if num > factorial(x)
      num -= factorial(x)
      i += 1
    elsif num === factorial(x)
      num -= factorial(x)
      i += 1
      p i
      answer << nums[i-1]
      nums.delete_at(i-1)
      nums.reverse.each do |n|
        answer << n
      end
      break
    else
      x -= 1
      answer << nums[i]
      nums.delete_at(i)
      p i
      i = 0
    end
  end
  return answer.join('')
end

# main

p find_by_order(10**6)


