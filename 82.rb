# Ruby 입니다.
=begin
  ** 저는 이 문제를 종이접기로 생각하였습니다. (기본적인 원리는 81번과 같습니다만, 위아래로 움직일 수 있다는 점이 다릅니다.)
  즉, 왼쪽에서 오른족으로 가장 왼쪽에 있는 2차원 배열의 요소들을 하나씩 터뜨려가면서 다음 열의 2차열 배열의 최소값을 구합니다.
  그리고 그것을 구하는 과정에서 2차원 배열의 가장 위에있는 요소(i=0)와 가장아래에 있는요소(i=79) 그리고 그 사이에 있는 요소(else)로 나누어 구했습니다.
  그리고 왼쪽에서 오른쪽으로 터뜨려갈때에는 재귀함수를 이용했습니다.
=end

class Problem82
  def self.find_ans
    processedArray = getFile
    vPopAlgorithm(processedArray, 80)
  end

  def self.getFile
    processedArray = []
    f = File.open('82nums.txt')
    f.each_line{ |line| processedArray << line.chomp.split(',').map{ |e| e.to_i }}
    processedArray
  end

  def self.vPopAlgorithm(array, level)
    if level === 1
      return array.flatten.min
    else
      0.upto(79) do |i|
        selection = []
        if i === 0
          0.upto(79) do |n| # same and downward part
            added = 0
            n.downto(i+1){ |t| added += array[t][1]} if n >= i+1
            temp = array[i][1] + array[n][0] + added
            selection << temp
          end
          array[i][1] = selection.min
        elsif i === 79
          array[i][1] += [array[78][1],array[79][0]].min
        else
          selection << (array[i-1][1] + array[i][1]) # upper part
          i.upto(79) do |n| # same and downward part
            added = 0
            n.downto(i+1){ |t| added += array[t][1]} if n >= i+1
            temp = array[i][1] + array[n][0] + added
            selection << temp
          end
          array[i][1] = selection.min
        end
      end
    end
    array.each_with_index{ |e,i| array[i].delete_at(0) }
    vPopAlgorithm(array, level-1)
  end
end

p Problem82.find_ans