# Ruby입니다.
=begin
  Prim알고리즘을 응용하였습니다.
  0번째 vertex부터 탐색을 시작하여, visited에 속하지 않는 vertex로 가지를 뻗어나가는 방식입니다.
  edge가 존재하지 않는곳은 -1 로 두고, min메소드가 양수음수 둘다 적용되므로,
  plus_min이라는 새로운 배열 메소드를 monkey patch했습니다.
=end

class Array
  def plus_min
    self.sort.each{ |n| return n if n > 0 }
    return 0
  end
end

class Problem107
  def self.find_ans
    sum_length = 0
    sum_min_length = 0
    metrix = []
    visited = [0]
    f = File.open("107_num.txt")
    f.each_line do |line|
      metrix.push(line.split(',').map{ |e| e === "-" ? -1 : e.to_i })
      metrix[-1].each{ |e| sum_length += e if e > 0 }
    end
    sum_length /= 2
    while visited.length < 40
      if visited.length === 1
        next_vertex = metrix[0].find_index(metrix[0].plus_min)
        visited.push(next_vertex)
        sum_min_length += metrix[0].plus_min
      else
        candidates = []
        visited.each do |v1|
          metrix[v1].each_with_index do |v2,i|
            candidates.push(v2) if !visited.include?(i)
          end
        end
        next_vertex = -1
        visited.each do |v1|
          metrix[v1].each_with_index do |v2,i|
            if v2 === candidates.plus_min && !visited.include?(i)
              next_vertex = i
              break
            end
          end
          break if next_vertex != -1
        end
        visited.push(next_vertex)
        sum_min_length += candidates.plus_min
      end
    end
    sum_length - sum_min_length
  end
end

start = Time.now
p Problem107.find_ans
p Time.now - start
