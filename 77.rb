# Ruby입니다.
=begin
  ** 이 문제도 동적프로그래밍 기법으로 해결하였습니다.
  1) 타겟을 3 부터 증가시킵니다 (counts의 초기값을 짝수면 1 홀수면 0 으로 합니다.)
  2) 그 타겟 이하의 coin을 준비합니다. 여기서 coin은 target이하의 소수의 집합입니다. >> 이 coin은 바로 전 타겟의 코인을 재활용해서 계산시간을 줄입니다.
  3) counts배열과 coin집합과 동적프로그래밍 기법으로 경우의 수를 세어줍니다.
  4) 만약 target에 대하여 counts[-1](가장 마지막 counts)가 5001을 넘지못하면 target을 하나증가시킵니다.
  5) 답을 출력합니다.

  ** counts[0] === 1 인 이유는 소수 하나를 사용했을 때의 경우의 수
=end

# setting
require 'prime'

class Problem77
  def self.find_ans
    target = 3 ; coin = []
    while 1
      counts = Array.new(target+1,0) ; counts.each_with_index{ |ele,index| counts[index] = 1 if index % 2 === 0 }
      coin << target if target.prime?
      coin.each do |k|
        counts.each_with_index do |oldcnt, index|
          counts[index] = oldcnt + counts[index-k] if index - k >= 0
        end
      end

      if counts[-1] < 5001
        target += 1
      else
        p counts
        return (counts.length - 1)
      end
    end
  end
end

p Problem77.find_ans