# Ruby 입니다.
=begin
  ** 67번에서 얻은 발상을 이용합니다.
  1) 파일을 읽어들이고, 그 데이터를 67번처럼 변경합니다. (피라미드가 위아래로 생성되는 이미지)
  2) 같은 알고리즘을 사용합니다. 단, 여기서 이미지가 피라미드가 위아래로 생성되므로, level에 따라서, 역피라미드일 경우와 피라미드일 경우를 나눠서 생각해야합니다.
  3) 답을 출력합니다.

  p.s 이문제를 동적 계획법으로 풀 수가 있군요. 신박하네요.
=end

class Problem81
  def self.find_ans
    processedArray = getFile
    getBack(processedArray,processedArray.length).join.to_i
  end

  def self.getFile
    # unprocessed array
    unprocessedArray = []
    f = File.open('81nums.txt')
    f.each_line{ |line| unprocessedArray << line.chomp.split(',').map{ |e| e.to_i } }

    # processed array
    processedArray = Array.new(159){ |e| e = Array.new }
    158.downto(0) do |s| # [a,b] a + b = s
      79.downto(0) do |a|
        next if a > s
        b = s-a
        break if b > s
        processedArray[s] << unprocessedArray[a][b]
      end
    end
    # return
    processedArray.map{ |e| e.compact }
  end

  def self.getBack(array, level)
    if level === 1
      array
    elsif level <= 80 # pyramid
      rowLast = array[-1] ; rowBefore = array[-2]
      0.upto(rowLast.length-2) do |i|
        if rowLast[i] >= rowLast[i+1]
          rowBefore[i] += rowLast[i+1]
        else
          rowBefore[i] += rowLast[i]
        end
      end
      array[-2] = rowBefore
      array.pop
      getBack(array, level-1)
    else # reverse pyramid
      rowLast = array[-1] ; rowBefore = array[-2]
      if rowLast.length != 1 # first row processing
        0.upto(rowBefore.length-3) do |i|
          if rowLast[i] >= rowLast[i+1]
            rowBefore[i+1] += rowLast[i+1]
          else
            rowBefore[i+1] += rowLast[i]
          end
        end
      end
      rowBefore[0] += rowLast[0] # Difference between the pyramid and reverse pyramid
      rowBefore[-1] += rowLast[-1]

      array[-2] = rowBefore
      array.pop
      getBack(array, level-1)
    end
  end
end

p Problem81.find_ans