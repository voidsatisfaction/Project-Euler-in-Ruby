# Ruby 입니다.
=begin
  ** ogak이라는 hash를 동적으로 늘려가서, 요소를 하나 씩 늘릴때마다(nextNum) 그 요소가 기존의 요소들과의 합과 차가 오각수를 만족하는 지 확인합니다.
  그리고 최소라는 것을 보장하기 위해서, answerSet이라는 배열에 위의 조건을 만족하는 요소들을 넣어둔 후, nextNum-(기존오각수의 최대값) > 배열의 최소값 을 만족하면 루프를 그만두도록 하였습니다.
  (왜냐하면, nextNum - 기존 오각수의 최대값은 증가함수이기 때문입니다.)
=end

class Problem44
  def self.find_ans
    ogak = {"1" => 0, "5" => 0} ; answerSet = []
    n = 3
    while 1
      p n
      nextNum = n*(3*n-1)/2
      ogak.each_key { |key| answerSet << (nextNum - key.to_i) if ogak.has_key?("#{nextNum - key.to_i}") && isOgak?(nextNum + key.to_i)}
      return answerSet.min if answerSet.length > 0 && answerSet.min < nextNum - ogak.max_by{|k,v| k}[0].to_i
      ogak["#{nextNum}"] = 0
      n += 1
    end
  end

  def self.isOgak?(num)
    value = (1+Math.sqrt(1+24*num))/6
    return value.ceil === value.floor
  end
end

p Problem44.find_ans
