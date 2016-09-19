# Ruby 입니다.
=begin
  ** 앞서 전외솔님께서 푸신 풀이와 같습니다.
  여기서 선형 방정식을 풀기 위해서, erase_phase + get_ans_phase => 가우스 소거법을 이용하였습니다.
  이 문제를 풀면서 가우스 소거법도 배우고, 참 유익했던것 같습니다.
  아, 그리고 Rational이라는 함수를 써서 계수를 정확히 계산하였습니다.
=end

class Problem101
  def self.find_ans
    ans = 0
    nums = get_nums{ |n| 1-n+n**2-n**3+n**4-n**5+n**6-n**7+n**8-n**9+n**10 }

    1.upto(10) do |num|
      bop = 0
      ary1,ary2 = exp_generator(num),nums[0..num-1]
      ary1,ary2 = erase_phase(ary1,ary2)

      exp = get_ans_phase(ary1,ary2)
      
      exp.each_with_index do |ele,index|
        bop += ele * (num+1) ** (num-index-1)
      end

      ans += bop if nums[num-1].to_f != bop
    end

    ans+1
  end

  def self.get_nums
    nums = []
    1.upto(10) { |n| nums << yield(n) }
    nums
  end

  def self.exp_generator(num)
    result = Array.new
    1.upto(num) do |x|
      temp = Array.new
      (num-1).downto(0){ |n|
        temp += [x**n]
      }
      result << temp
    end
    result
  end

  def self.erase_phase(ary1,ary2)
    0.upto(ary1.length-2) do |n| # select std row
      standard_row = ary1[n] ; standard_value = ary2[n]
      (n+1).upto(ary1.length-1) do |t| # select oth row
        contrast_row = ary1[t] ; contrast_value = ary2[t]
        mag_value = - Rational(contrast_row[n]/standard_row[n])

        standard_row.each_with_index do |ele,index|
          contrast_row[index] += ele * mag_value
        end

        ary2[t] += standard_value * mag_value
      end
    end

    return ary1,ary2
  end

  def self.get_ans_phase(ary1,ary2)
    ans_ary = Array.new(ary2.length,0)
    ary1.reverse.each_with_index do |ele,index|
      if index === 0
        ans_ary[-index-1] = ary2[-index-1] / ele[-1]
      else
        0.upto(index-1) do |i|
          ary2[-index-1] -= ele.reverse[i] * ans_ary.reverse[i]
        end
        ans_ary[-index-1] = ary2[-index-1] / ele[-index-1]
      end
    end
    ans_ary.map{ |e| e.to_f }
  end
end

p Problem101.find_ans