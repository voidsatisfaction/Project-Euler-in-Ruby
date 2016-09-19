
class Problem104
  def self.find_ans
    l_cnt = 2 ; cnt = 2
    before_num = 1 ; next_num = 1
    l_before_num = 1 ; l_next_num = 1

    while 1
      l_next_num,l_before_num = (l_next_num + l_before_num) % 10**9, l_next_num
      l_cnt += 1

      if pandigital?(l_next_num.to_s)
        while cnt < l_cnt
          next_num,before_num = next_num + before_num, next_num
          cnt += 1
          return cnt if (cnt === l_cnt) && pandigital?(next_num.to_s[0..8])
        end
      end

      p l_cnt
    end

  end

  def self.pandigital?(str)
    return "123456789" === str.split('').sort.join
  end

end

p Problem104.find_ans