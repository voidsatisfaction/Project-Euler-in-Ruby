
class Problem94
  LIMIT = 10**9
  def self.find_ans
    x = 6 ; sum = 0

    while (3*x - 2 <= LIMIT || 3*x + 2 <= LIMIT)
      sum += almost_tri_circum(x)
      x += 2
    end

    sum
  end

  def self.perfect_square?(num)
    n0 = (num / 2) + 1
    n1 = (n0 + (num / n0)) / 2

    while (n1 < n0)
      n0 = n1
      n1 = (n1 + (num / n1)) / 2
    end

    return n0**2 === num
  end

  def self.almost_tri_circum(x)
    sum = 0

    sum += (3*x-2) if perfect_square?((3*x-2)*(x-2))
    sum += (3*x+2) if perfect_square?((3*x+2)*(x+2))

    sum
  end
end

p Problem94.find_ans
