# Ruby 입니다.
=begin
  교휸 : 보이는 것이 다가 아니다.
  문제가 있는그대로 잘 풀리지 않을 경우에는 다른 각도에서 접근하자(추상화)
  제약 조건을 잘 파악하자.

  일단 그림이 들어가있어서 겁먹어서 풀지 못하고 있었던 문제였는데 시험기간이기도 하고 자신감이 붙어서 풀어봤습니다.
  1. 마방진 외부의 최소의 수를 6부터 1까지 확인합니다. 만약 6 초과인 경우에는 성립하지 않습니다.
  2. 그리고 외부의 수의 경우가 될 수 있는 5가지의 outer_nums를 permutation을 이용하여 구합니다.(10과 outer_lowest는 반드시 포함되어야합니다.)
  3. 각각의 outer_set(외부의 수가 될 수 있는 경우의 수)의 자료구조를 변경합니다. ex) [[6 0 0], [9 0 0], ... [10 0 0]]
  4. 그리고 마방진의 성질에 의하여 내부의 수 하나만 정하면 나머지가 모두 결정되므로 bruteforce로 알아봅니다.(연쇄 반응)
  5. 완성시킨 shape를 숫자로 변환후 리스트에 저장합니다.(satisfied_set)
  6. 그 리스트 중 가장 큰 수를 구합니다. (max 메소드)

  0.001sec
=end

class Problem68
  def self.find_ans
    6.downto(1) do |outer_lowest|
      satisfied_set = []

      outer_nums = ((outer_lowest+1)..9).to_a.combination(3).to_a.map{ |e| e.insert(0,10) }.map{ |e| e.permutation(4).to_a }.flatten(1)

      # outer part
      outer_nums.each do |outer_set|
        inner = (1..10).to_a - outer_set - [outer_lowest]
        shape = Array.new(5){ Array.new(3){ 0 } }
        shape[0][0] = outer_lowest
        1.upto(shape.length-1){ |i| shape[i][0] = outer_set[i-1] } # shaping

        # inner part
        inner.each do |first| # first candidate is placed just next outer_lowest in shape
          continue = true
          cans = (1..10).to_a - outer_set - [outer_lowest] # inner candidates

          #zig
          shape[0][1] = first
          cans -= [first]

          1.upto(4) do |i|
            if i % 2 === 1
              value = shape[i-1].reduce(:+) - shape[i][0]
              shape[i][2] = value
              continue = false if !cans.include?(value)
            else
              value = shape[i-1][2]
              shape[i][1] = value
            end
            cans.delete(value)
          end

          next if !continue
          
          #zag
          shape[-1][-1] = first
          sum = shape[-1].reduce(:+)

          0.upto(3) do |i|
            if i % 2 === 0
              value = sum - shape[i].reduce(:+)
              shape[i].map!{ |e| e === 0 ? value : e }
              continue = false if !cans.include?(value)
            else
              value = shape[i-1][2]
              shape[i][1] = value
            end
            cans.delete(value)
          end

          next if !continue

          satisfied_set << shape.flatten.join.to_i
        end
      end

      return satisfied_set.max if !satisfied_set.empty?
    end
  end
end

start = Time.now
p Problem68.find_ans
p Time.now - start
