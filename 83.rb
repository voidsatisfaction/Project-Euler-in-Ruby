# Ruby 입니다.
=begin
  데이터를 map과 sum_map으로 나눕니다.
  map은 원래의 수들을 이차원 배열화 시킨것이고, sum_map은 왼쪽위의 원소부터 합으로 더해가는 자료들의 이차원배열입니다.
  어떠한 phase에서 sum_map의 원소중 최소인 원소의 좌표를 기억합니다.(find_minimum_target)
  그리고 그 최소 원소의 좌표의 상하좌우 좌표들에 있는 sum_map원소들을 변경해줍니다.
  이러한 프로세스를 sum_map의 오른쪽 가장아래 자료 sum_map[-1][-1]가 0보다 커질때 까지 계속 반복합니다.
  답을 출력합니다.

  오늘 공대생 후배의 알고리즘 문제를 도와주다가 깨달은 풀이법입니다.
=end
class Problem83
  def self.find_ans
    map = read_file("83nums.txt")
    sum_map = init(map)

    row_length = map.length
    column_length = map[0].length

    until sum_map[-1][-1] > 0
      minimum_target = find_minimum_target(sum_map,row_length,column_length)

      find_adjacent_sum(sum_map,map,minimum_target,row_length,column_length)
    end

    sum_map[-1][-1]
  end

private
  def self.read_file(file_name)
    map = []
    f = File.open(file_name)

    f.each_line do |line|
       map << line.chomp.split(",").map{ |e| e.to_i }
    end

    map
  end

  def self.init(map)
    num_row = map.length
    num_column = map[0].length

    sum_map = Array.new(num_row){ Array.new(num_column,0) }
    sum_map[0][0] = map[0][0]

    return sum_map
  end

  def self.find_minimum_target(sum_map,row_length,column_length)
    minimum_target = [[0,0],-1]

    0.upto(row_length-1) do |row|
      0.upto(column_length-1) do |column|
        target_val = sum_map[row][column]

        if minimum_target[1] < 0 && target_val > 0
          minimum_target = [[row,column],target_val]
        elsif minimum_target[1] > 0 && target_val > 0 && target_val < minimum_target[1]
          minimum_target = [[row,column],target_val]
        end
      end
    end

    minimum_target
  end

  def self.find_adjacent_sum(sum_map,map,minimum_target,row_length,column_length)
    row,column = *minimum_target[0]
    target_val = sum_map[row][column]

    sum_map[row-1][column] = target_val + map[row-1][column] if row > 0 && sum_map[row-1][column] === 0
    sum_map[row+1][column] = target_val + map[row+1][column] if row < row_length - 1 && sum_map[row+1][column] === 0
    sum_map[row][column-1] = target_val + map[row][column-1] if column > 0 && sum_map[row][column-1] === 0
    sum_map[row][column+1] = target_val + map[row][column+1] if column < column_length - 1 && sum_map[row][column+1] === 0

    sum_map[row][column] = -1
  end
end

p Problem83.find_ans
