# Ruby 입니다.
=begin
  ** 학교 과제에서 했던 것이 생각 나네요. x**y % z === ((x**a)**2 * (x**b)) % z 임을 이용하였습니다. (단, a,b는 각각 y를 2로나눈 몫과 나머지)
=end

class Problem97
  LIMIT = 10**10
  def self.find_ans
    answer = (28433 * getRemainsOf(2,7830457) + 1) % LIMIT
    answer
  end

  def self.getRemainsOf(x,y)
    if x**y < 10**10
      x**y
    else
      a,b = y.divmod(2)
      value = (getRemainsOf(x,a)**2 * (x**b)) % LIMIT
    end
  end
end

p Problem97.find_ans