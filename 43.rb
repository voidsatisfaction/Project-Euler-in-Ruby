# Ruby 입니다.
# 이번 기회에 permutation 이라는 아주 유용한 메소드를 알아갑니다. ㅠㅠ
# 그것을 몰랐기 때문에 다른 하나의 방법으로, 뒤에서 부터 생각하기 (17의 배수)로 해서 연산량을 줄였습니다.
# 코드가 매우 지저분하네요.

# variables
ans_sum = 0
prime_numbers = [2, 3, 5, 7, 11, 13].sort{ |a, b| b<=>a }

# functions
def pandigital?(str) # check certain number is pandigital or not
  if str.split('').uniq.length === str.split('').length
    return true
  else
    return false
  end
end

def pandigital_3(num) # making 3digits pandigital with specific multiplier
  pandigital_array = Array.new
  a = 100/num
  b = 1000/num
  for x in a+1..b
    candidate = num * x
    if pandigital?(candidate.to_s)
      pandigital_array << candidate.to_s
    end
  end
  return pandigital_array
end

def zero_nine_pandigital?(num) # check whether it is 0-9 pandigital or not
  prototype = Array.new(9){ |i| i+1 } << 0
  if num.to_s.length != 10 # check first digit number
    return false
  else
    if num.to_s.split('').uniq.sort === prototype.map{ |ele| ele.to_s }.sort
      return true
    else
      return false
    end
  end
end

def pandigi_add(str, prime)
  result = Array.new
  for x in 0..9
    new_num = "#{x}" + "#{str}"
    result << new_num if (new_num[0..2].to_i % prime === 0) && pandigital?(new_num)
  end
  result
end

def making_conditional_pandigital(p_n) # process from 17 to 2
  plate = Array.new
  plate[0] = pandigital_3(17) # generating 17 multiple 3digits pandigital numbers
  i = 0
  p_n.each do |prime|
    temp_array = Array.new
    plate[i].each do |ele|
      pandigi_add(ele, prime).each { |k| temp_array << k } if pandigi_add(ele, prime).length
    end
    plate[i+1] = temp_array
    i += 1
  end

  temp_array = Array.new
  plate[-1].each do |ele|
    num_pro = plate.length
    for x in 0..9
      if !ele.include?(x.to_s)
        temp_array << ("#{x}" + "#{ele}")
      end
    end
  end
  plate[plate.length] = temp_array

  return plate # In this plate, you can see the change of candidates
end

# main
making_conditional_pandigital(prime_numbers)[-1].each do |ele|
  if zero_nine_pandigital?(ele.to_i)
    ans_sum += ele.to_i
  end
end

p ans_sum

