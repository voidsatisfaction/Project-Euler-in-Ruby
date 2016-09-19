# Ruby입니다.
=begin
  a(n) : n칸을 1 or 2 or 3 or 4칸을 차지하는 블록으로 놓는 경우의 수 라고 합니다.
  n칸을 블록으로 놓는 경우의 수는(단, n >= 4)
  1. 제일 앞칸에 1칸짜리 블록을 놓는 경우
  2. " 2칸짜리 블록을 놓는 경우
  3. " 3칸짜리 블록을 놓는 경우
  4. " 4칸짜리 블록을 놓는 경우
  이렇게 나눌 수 있습니다.
  즉, a(n) = a(n-1) + a(n-2) + a(n-3) + a(n-4) 가 되고,
  a(0),a(1),a(2),a(3) = 1,1,2,4이기 때문에
  Dynamic Programming (이 경우 쉽게 말하면 배열)을 이용하면 쉽게 풀 수 있습니다.
=end

class Problem117
  def self.find_ans
    number_of_cases(50)
  end

  def self.number_of_cases(n)
    cache = [0,1,2,4,8,15]

    6.upto(n) do |i|
      next_num = cache[-1] + cache[-2] + cache[-3] + cache[-4]
      cache.push(next_num)
    end

    cache[-1]
  end
end

p Problem117.find_ans
