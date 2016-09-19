# Ruby 입니다.
=begin

=end
class Problem116
  def self.find_ans
    red,green,blue = 2,3,4
    number_of_cases(50,red) + number_of_cases(50,green) + number_of_cases(50,blue)
  end

  def self.number_of_cases(n,m)
    cache = [1] # the first element is a(m,m)

    (m+1).upto(n) do |i|
      diff = i-m
      next_num = cache[-1] + 1
      next_num += cache[diff-m] if diff >= m
      cache.push(next_num)
    end

    cache[-1]
  end
end

start = Time.now
p Problem116.find_ans
p Time.now - start
