
class Problem94
  def self.find_ans
    pell_ans(2,1,2,1,3,[],10**9+1).reduce(:+) * 2
  end

  def self.pell_ans(x1,y1,x,y,n,answers,limit)
    if 2*x < limit
      xa = x1*x + n*y1*y
      ya = x1*y + y1*x
      answers << xa if 2*xa < limit
      pell_ans(x1,y1,xa,ya,n,answers,limit)
    else
      return answers
    end
  end
end

p Problem94.find_ans
