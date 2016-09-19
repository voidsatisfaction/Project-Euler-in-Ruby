
class Problem100
  def self.find_ans
    sum = 10**12
    while 1
      p sum
      blue = (sum * (1.0/2)**0.5).to_i
      value = (2*sum-1)**2 - 2*(2*blue-1)**2
      while value >= -1
        value = (2*sum-1)**2 - 2*(2*blue-1)**2
        return blue if value === -1
        blue += 1
      end
      sum += 1
    end
  end
end

p Problem100.find_ans

=begin
require 'bigdecimal'

class Problem100
  def self.find_ans
    sum = 10**12
    while 1
      blue = (1 + Math.sqrt((2*sum*(sum-1)+1)))/2.0
      if blue.ceil === blue.floor
        temp = blue
        blue = BigDecimal.new("#{blue}")
        return temp if (blue*(blue-1))/(sum*(sum-1)) === 0.5
      end
      sum += 1
    end
  end
end

p Problem100.find_ans
=end

