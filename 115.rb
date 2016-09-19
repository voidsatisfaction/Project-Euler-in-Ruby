# Ruby입니다. 114번에서 m으로 변수로 치환해주었습니다.

class Problem115
  def self.find_ans
    n = 57
    loop do
      break if Problem115.number_of_cases(50,n)[-1] > 1000000
      n += 1
    end
    n
  end
  def self.number_of_cases(m,n)
    cases = Array.new(m){ 1 } # a0 a1 a2

    m.upto(n) do |n|
      next_num = 0
      (n-(m+1)).downto(0) do |i|
        next_num += cases[i]
      end
      next_num = next_num + cases[-1] + 1
      cases.push(next_num)
    end
    cases
  end
end

start = Time.now
p Problem115.find_ans
p Time.now - start
