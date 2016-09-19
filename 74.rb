# Ruby 입니다. 계산 과정을 저장해 두는 발상을 하지 못해서 시간이 오래걸려요 ㅠㅠ

=begin
  1) 1부터 각 숫자마다 반복되까지의 수열들을 모아놓는 loopArray을 만들어둡니다.
  2) 1부터 100만까지 주어진 조건을 만족하는 수들을 카운팅해줍니다.
  3) 답을 출력합니다.
=end

class Problem74
  def self.find_ans
    count = 0
    1.upto(10**6) do |target|
      loopArray = [target]
      while 1
        newVal = nextVal(loopArray[-1])
        if loopArray.include?(newVal)
          count += 1 if loopArray.length === 60
          break
        end
        loopArray << newVal
      end
      p target
    end
    count
  end

  def self.nextVal(num)
    newVal = 0
    until num === 0
      newVal += factorial(num % 10)
      num /= 10
    end
    newVal
  end

  def self.factorial(n)
    (1..n).inject(1, :*)
  end
end

p Problem74.find_ans