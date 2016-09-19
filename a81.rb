# Ruby 입니다.
=begin
  ** 이 풀이는 67번처럼 자료구조를 변형시키지 않고 푼 풀이입니다.
=end

class Problem81
  def self.find_ans
    targetArray = getFile

    popAlgorithm(targetArray,targetArray.length)
  end

  def self.getFile
    processedArray = []
    f = File.open('81nums.txt')
    f.each_line{ |line| processedArray << line.chomp.split(',').map{ |e| e.to_i } }
    processedArray
  end

  def self.popAlgorithm(target,level)
    if level === 1
      return target[0][-1]
    else
      target[0].each_with_index{ |ele,index| target[0][index] += target[0][index-1] if index > 0 } if level === 80 # Only for first level
      target[1][0] += target[0][0]

      1.upto(target[1].length-1) do |i|
        if target[0][i] >= target[1][i-1]
          target[1][i] += target[1][i-1]
        else
          target[1][i] += target[0][i]
        end
      end
      target.shift
    end
    popAlgorithm(target,level-1)
  end
end

p Problem81.find_ans