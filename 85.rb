# Ruby 입니다.
=begin
  x,y 격자점 내의 정수길이의 사각형의 개수 ==> x(x+1)/2 * y(y+1)/2
  임을 이용하면 쉽게 풀 수 있습니다.
=end

class Problem85
  TARGET = 2000000
  def self.find_ans
    answer = 0
    king = 2000000
    1.upto(1000) do |x|
      1.upto(1000) do |y|
        value = x * (x+1) * y * (y+1) / 4
        break if value > TARGET
        challenger = (value - TARGET).abs
        if challenger <= king
          king = challenger
          answer = x * y
        end
      end
    end
    answer
  end
end

p Problem85.find_ans