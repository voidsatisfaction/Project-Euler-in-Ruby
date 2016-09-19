# Ruby 입니다.
=begin
  ** (p1,p2,p3)의 경우의 수에 대한 value_array의 uniq한 값의 요소개수를 구하는 방식으로 풀었습니다.
  1) p1, p2, p3이 될 수 있는 범위를 구하고 그 범위 내의 소수집합을 생성합니다.
  2) 가장 수가 큰 p3부터 p3_array의 수를 하나씩 넣어보면서 p2 p1을 돌립니다.

  다른 분들의 풀이를 보니, 소수 배열을 하나만 쓰면서 늘려가는 군요. 멋있네요!!
=end

class Problem87
  NUMBER = 50000000
  def self.find_ans
    value_array = []
    # value = p1**2 + p2**3 + p3**4
    p1_array = primeUntil(NUMBER**(1.0/2))
    p2_array = primeUntil(NUMBER**(1.0/3))
    p3_array = primeUntil(NUMBER**(1.0/4))
    p3_array.each do |p3|
      p2_array.each do |p2|
        break if p3**4 + p2**3 >= NUMBER
        p1_array.each do |p1|
          value = p1**2 + p2**3 + p3**4
          if value < NUMBER
            value_array << value
          else
            break
          end
        end
      end
    end
    value_array.uniq.length
  end

  def self.primeUntil(n)
    numArray = (2..n).to_a
    numArray.each do |ele1|
      numArray.delete_if{ |ele2| ele2 % ele1 === 0 && ele1 != ele2 }
    end
    numArray
  end
end

p Problem87.find_ans