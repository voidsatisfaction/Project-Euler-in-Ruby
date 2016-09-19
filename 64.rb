# Ruby 입니다.
=begin
  1) 각 수를 문제에서 주어진 것 처럼 [정수, [반복되는 수열]]로 나타내는 함수를 새로 정의하였습니다 (self.numAnalizer)
  2) 1에서 10000까지에서 주어진 조건을 만족하는 수를 카운트 해줍니다.
=end

class Problem64
  def self.find_ans
    count = 0
    1.upto(10000) do |num|
      if Math.sqrt(num).ceil === Math.sqrt(num).floor
        next
      else
        count += 1 if numAnalizer(num)[1].length % 2 === 1
      end
    end
    count
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
    p result
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

p Problem64.find_ans