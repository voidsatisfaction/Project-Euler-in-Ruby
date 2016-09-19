# Ruby 입니다.
# 64번문제와 펠 방정식 참조. 연분수꼴에서 d의 방정식의 답이 나올때 까지 페이즈를 늘려가며 탐색합니다.

class Problem66
  def self.find_ans
    count = 0 ; answer = [0,0] #[d,min_max_x]
    1.upto(1000) do |d|
      if Math.sqrt(d).ceil === Math.sqrt(d).floor
        next
      else
        x = get_x(d)
        answer = [d,x] if x > answer[1]
      end
    end

    answer[0]
  end

  def self.get_x(d)
    phase = 0
    pattern = numAnalizer(d)

    while 1
      frac = get_value_phase(pattern,phase)

      return frac[0] if frac[0]**2 - d*frac[1]**2 === 1
      phase += 1
    end
  end

  def self.get_value_phase(pattern,phase)
    index = phase % pattern[1].length
    frac = [1,pattern[1][index]]

    while phase > 0
      index = phase % pattern[1].length
      frac = phase_cal(pattern[1][index-1],frac)
      phase -= 1
    end
    return [pattern[0]*frac[1]+frac[0],frac[1]]
  end

  def self.phase_cal(a,frac)
    return [frac[1],a*frac[1]+frac[0]]
  end

  def self.numAnalizer(num) # should return [integer_part, [circular_part]]
    if Math.sqrt(num).ceil != Math.sqrt(num).floor
      result = [] ; circular = [] ; recorder = Array.new
      numer = 1
      result << getInt(Math.sqrt(num)) # get integer from initial value
      nums = result[-1]

      while 1 # get circular_part from remains
        remains = [numer,[num,nums]]
        break if recorder.include?(remains)
        recorder << remains

        deno = num - nums**2
        c_remains = [[numer,remains[1][0],remains[1][1]],deno]
        if c_remains[1] % c_remains[0][0] === 0
          c_remains[1] /= c_remains[0][0] ; c_remains[0][0] = 1
        end

        value = c_remains[0][0] * (Math.sqrt(c_remains[0][1]) + c_remains[0][2]) / c_remains[1]
        circular << getInt(value)

        numer = c_remains[1] ; num = c_remains[0][1] ; nums = (c_remains[0][2] - (c_remains[1] * circular[-1])).abs
      end
    else
      num
    end
    result << circular
    return result
  end

  def self.getInt(num)
    i = 0
    while 1
      return i if num - i < 1
      i += 1
    end
  end
end

p Problem66.find_ans
