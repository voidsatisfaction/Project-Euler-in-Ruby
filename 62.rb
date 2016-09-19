# Ruby 입니다. 시간이 1분 이상걸립니다.

=begin
  1) candidates라는 2차원 배열을 준비합니다. 이 배열은 [[num, count]]의 구조로 되어있습니다. (num은 i**3입니다.)
  2) i를 1씩 증가시키면서 각 3승을 한 값이 candidates에 포함이 되는지를 확인합니다. (permutation은 결국 sort하면 같은 값이라는 것을 이용합니다 eleInculude?) 포함되면 count+=1
  3) 만약, i**3가 자릿수가 변할경우에는 candidates를 리셋합니다.
  4) count === 5 이면 답을 출력합니다.
=end

class Problem62
  def self.find_ans
    i = 5 ; candidates = Array.new
    while 1
      p i
      candidates = Array.new if (i**3).to_s.length != ((i-1)**3).to_s.length
      result, index = eleInclude?(candidates, i**3)
      if result
        candidates[index][1] += 1
        return candidates[index][0] if candidates[index][1] === 5
      else
        candidates << [i**3, 1]
      end
      i += 1
    end
  end

  def self.eleInclude?(candidates, target)
    candidates.each_with_index do |ele, index|
      return true, index if ele[0].to_s.split('').sort.join === target.to_s.split('').sort.join
    end
    false
  end
end

# Problem62.find_ans

class Problem62_other
  def self.find_ans
    dic = {} ; i = 5
    while 1
      n = i**3
      key = n.to_s.split('').sort.join
      if !dic.has_key?(key)
        dic[key] = [n,1]
      else
        dic[key][1] += 1
        return dic[key][0] if dic[key][1] === 5
      end
      i += 1
    end
  end
end

p Problem62_other.find_ans