# 루비 입니다.
# 먼저, 수학적으로 계산량을 줄이기 위하여 1,3,7,9를 조합한 수를 만들고
# 그 다음, 그 수가 소수인지 아닌지를 먼저 판별 한 후 ( 소수라면, candidates 라는 후보군 배열에 넣습니다)
# 그리고 candidates의 모든 요소에 대하여 자릿수를 바꿔주는 함수를 걸어서
# 그 수들이 모두 소수인지 확인하는 방식으로 풀었습니다.
# 아 그런데 계산량을 줄인건 그렇다고 쳐도, 코드 자체가 너무 무식하네요.. 나중에 개량해야 할 것 같습니다.
# 밤이라 머리가 안돌아가네요..

# variables
con = [1,3,7,9]
count = 4
candidates = Array.new
# after 10 >> only use 1, 3, 7, 9

# functions
def prime?(n)
  if n === 1
    result = false
  else
    result = true
    for x in 2..n**(0.5)
      if n % x === 0
        result = false
        break
      end
    end
  end
  return result
end

def num_circular(num)
  num_array = Array.new
  num_array << num
  n = num.to_s
  place = n.length
  case n.length
  when 2
    for x in 1..(n.length-1)
      new_num = (n[0-x] + n[1-x]).to_i
      num_array << new_num
    end
  when 3
    for x in 1..(n.length-1)
      new_num = (n[0-x] + n[1-x] + n[2-x]).to_i
      num_array << new_num
    end
  when 4
    for x in 1..(n.length-1)
      new_num = (n[0-x] + n[1-x] + n[2-x] + n[3-x]).to_i
      num_array << new_num
    end
  when 5
    for x in 1..(n.length-1)
      new_num = (n[0-x] + n[1-x] + n[2-x] + n[3-x] + n[4-x]).to_i
      num_array << new_num
    end
  else
    for x in 1..(n.length-1)
      new_num = (n[0-x] + n[1-x] + n[2-x] + n[3-x] + n[4-x] + n[5-x]).to_i
      num_array << new_num
    end
  end
  return num_array
end
# main

# 한자릿수 : 2, 3, 5, 7
# 두자릿수
count = 4
for place in 2..6
  case place
  when 2
    con.each do |a|
      con.each do |b|
        value = 10 * a + b
        if prime?(value)
          candidates << value
        end
      end
    end
  when 3
    con.each do |a|
      con.each do |b|
        con.each do |c|
          value = 10**(2) * a + 10 * b + c
          if prime?(value)
            candidates << value
          end
        end
      end
    end
  when 4
    con.each do |a|
      con.each do |b|
        con.each do |c|
          con.each do |d|
            value = 10**3 * a + 10**2 * b + 10 * c + d
            if prime?(value)
              candidates << value
            end
          end
        end
      end
    end
  when 5
    con.each do |a|
      con.each do |b|
        con.each do |c|
          con.each do |d|
            con.each do |e|
              value = 10**4 * a + 10**3 * b + 10**2 * c + 10 * d + e
              if prime?(value)
                candidates << value
              end
            end
          end
        end
      end
    end
  else
    con.each do |a|
      con.each do |b|
        con.each do |c|
          con.each do |d|
            con.each do |e|
              con.each do |f|
                value = 10**5 * a + 10**4 * b + 10**3 * c + 10**2 * d + 10 * e + f
                if prime?(value)
                  candidates << value
                end
              end
            end
          end
        end
      end
    end
  end
end

candidates.each do |can|
  nums = num_circular(can)
  k = true
  nums.each do |nums|
    if !prime?(nums)
      k = false
    end
  end
  if k === true
    count += 1
  end
end

p count