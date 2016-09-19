# Ruby 입니다. 로그를 이용하면 빠르게 문제를 풀 수 있습니다.

class Problem99
  def self.find_ans
    king = [0,0] # value, line number
    f = File.open('99nums.txt')
    f.each_line.with_index do |line,index|
      numArray = line.split(',').map{ |e| e.to_i }
      value = logCal(*numArray)
      king = [value, index+1] if value > king[0]
    end
    king
  end

  def self.logCal(a,b)
    b * Math.log(a)
  end
end

p Problem99.find_ans