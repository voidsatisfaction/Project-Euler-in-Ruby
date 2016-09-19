# Ruby 입니다.
# explanation
=begin
  1) Input is from 1 to 10000
  2) 라이크렐 수가 아닌 수를 셉니다. 여기서 재귀합수를 이용합니다. level을 0 부터 해서 50까지 재귀하는 도중에, 만일, 대칭수가 있다면 count를 1 증가시킵니다.
  3) 10000 - count 로 라이크렐수를 셉니다
=end

# setting

# functions
def find_ans
  count = 0
  level = 0
  1.upto(10000){ |target|
    count, level = check_non_ly(target, level, count)
  }
  p 10000 - count
end

def check_non_ly(num, level, count)
  return count, 0 if level === 50
  ori_num = num ; rev_num = num.to_s.reverse.to_i
  sum_num = ori_num + rev_num
  if palindrome?(sum_num)
    count += 1
    return count, 0
  end
  check_non_ly(sum_num, level+1, count)
end

def palindrome?(num)
  return true if num === num.to_s.reverse.to_i
  return false
end


# main
find_ans