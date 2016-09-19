# explanation
=begin
  이 문제가 점화식 구조임을 알면 쉽습니다.
  1) 각level마다 분자 분모의 값을 1차원 배열로 저장합니다
  2) 주어진 조건을 만족하면 count를 하나 더해줍니다.
  3) 답을 출력합니다.
  p.s StriTz님의 풀이 항상, 잘 배우고있습니다. 여기서 블록을 이용하는군요. 대단하십니다.
=end

# setting

class Problem57
  def self.find_ans
    values = Array.new
    count = 0
    1.upto(1000) do |level|
      values = getNumDenominator(level,values)
      count += 1 if confirm_condition?(values[0],values[1])
    end
    count
  end

  def self.getNumDenominator(level,values)
    if level === 1
      return values = [3,2]
    else
      numer = values[0] + 2*values[1]
      deno = values[0] + values[1]
      values[0] = numer
      values[1] = deno
      return values
    end
  end

  def self.confirm_condition?(numer, deno)
    if numer.to_s.length > deno.to_s.length
      return true
    else
      return false
    end
  end
end

p Problem57.find_ans