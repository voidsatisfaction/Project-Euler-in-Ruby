# Ruby 입니다.
=begin
  사람이 제곱근의 값을 근사할때 구하는 방식으로 문제를 해결하였습니다.
  Ex)
  1.4 * 1.4
  1.41 * 1.41
  ...

  기본적인 원리는 다음고 같습니다.
  1) 먼저, 구하고자 하는 숫자의 제곱근의 정수 부분을 구합니다.
  2) target이 정수이면 Bigdecimal을 이용하기 위해서 v(다음 값)을 소수점과 함께 재정의 합니다.
  3) 여기서 i 를 9부터0까지 내려가면서 v * v 를 계산함으로써 가장 처음으로 value보다 작아지는 v를 구한 후 다시 target으로 돌려줍니다.
  4) 이를 계속반복하여 100번째 까지의 합을 구합니다.

  >> 여기서 주의해야 할 점은, 도중에 0이 연속해서 나오는 경우가 있다는 겁니다. 그리고 Bigdecimal(1.10) === Bigdecimal(1.100)이 같기때문에 0을 인위적으로 넣어주어야 합니다.
  이 부분의 코드를 다시 손 보는 것을 권장합니다.
=end

require 'bigdecimal'

class Problem80
  def self.find_ans
    counts = 0
    1.upto(100) do |num|
      p num
      next if Math.sqrt(num).ceil === Math.sqrt(num).floor
      counts += getNumsCounts(num)
    end
    counts
  end

  def self.getNumsCounts(value)
    target = Math.sqrt(value).floor
    while target.to_s.length < 105 # Beacause of .(dot)
      9.downto(0) do |i|
        if target.integer?
          v = BigDecimal.new(target.to_s + "." + i.to_s)
        else
          if i > 0
            v = BigDecimal.new(target.to_s[0..-3] + i.to_s + "E1")
          else
            t = 0
            while 1
              t += 1
              9.downto(1) do |k|
                v = BigDecimal.new(target.to_s[0..-3] + "0"*t + "#{k}" + "E1")
                break if v * v < value
                break if k === 1
              end
              break if v * v < value
            end
          end
        end
        if v * v < value
          target = v
          break
        end
      end
    end
    counts = 0
    target.to_s[2..101].split('').each{ |ele| counts += ele.to_i }
    counts
  end
end

p Problem80.find_ans