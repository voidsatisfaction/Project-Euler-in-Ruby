# Ruby 입니다.
=begin
  ** 여담이지만, 오일러 프로젝트 덕분에 동적 프로그래밍에 대한 개념을 이해할 수 있었습니다.
  알고리즘을 전문적으로 공부해 본 적이 없지만 덕분에 수많은 테크닉을 알아갑니다. ^^

  동적 프로그래밍을 이용합니다. 31번 문제에서의 목표값을 100원 동전은 1 ~ 100원까지 준비되어있다고 가정합니다.
=end

class Problem76
  def self.find_ans
    coin = (2..100).to_a
    count = Array.new(101, 1)
    coin.each do |k|
      count.each_with_index do |oldcnt, index|
        if index - k >= 0
          count[index] = oldcnt + count[index - k]
        else
          count[index] = oldcnt
        end
      end
    end
    (count[-1] - 1)
  end
end

p Problem76.find_ans