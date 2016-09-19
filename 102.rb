# Ruby입니다.
=begin
  ** 원점O가 삼각형 안에 있다면, 삼각형ABC가 있을때 면적으로, AOB + AOC + BOC === ABC 임을이용하였습니다.
  그리고 세 점이 주어진 경우 삼각형의 넓이를 구하는 공식을 이용하였습니다.
=end

class Problem102
  def self.find_ans
    cnt = 0
    f = File.open('102nums.txt')
    f.each_line do |line|
      dots = []
      new_ary = line.chomp.split(',').map{ |e| e.to_i }

      for x in [0,2,4]
        dots << new_ary[x..x+1]
      end
      a,b,c = [dots[0][0],dots[0][1]],[dots[1][0],dots[1][1]],[dots[2][0],dots[2][1]]

      entire_area = extent(a,b,c)
      area_with_0 = extent(a,b,0) + extent(a,c,0) + extent(b,c,0)

      cnt += 1 if entire_area === area_with_0
    end
    cnt
  end

  def self.extent(*dots)
    x1,x2,x3 = dots[0][0],dots[1][0],dots[2][0]
    y1,y2,y3 = dots[0][1],dots[1][1],dots[2][1]
    return 1.0/2 * (x1*y2 + x2*y3 + x3*y1 - x2*y1 - x3*y2 - x1*y3).abs
  end
end

p Problem102.find_ans
