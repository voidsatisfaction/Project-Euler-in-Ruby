# Ruby 입니다.
=begin
  ** 50*50의 좌표평면상의 모든 점을 구한 뒤, (0,0)을 고정시키고, 각각의 삼각형에 대한 직각삼각형의 판별을 통해 개수를 구하였습니다.
  1) 배열을 이용하여 (0,0)부터 (50,50)의 점을 생성합니다.
  2) 점을 하나 지정하면, 나머지 점은 그것을 제외한 나머지것들 (이미 갯수를 샌 것들은 제외)로 지정하여 각각의 경우에 직각삼각형인지 판별합니다.
  3) 답을 출력합니다.
=end

class Problem91
  def self.find_ans
    cnt = 0

    dots = mkdots(0,50) - [0,0]
    0.upto(dots.length-1){ |n1| (n1+1).upto(dots.length-1) { |n2| cnt += 1 if rec?(dots[n1],dots[n2]) } }

    cnt
  end

private
  def self.mkdots(a, b)
    dots = []
    a.upto(b){ |x| a.upto(b) { |y| dots << [x,y] } }
    dots
  end

  def self.rec?(dot1, dot2)
    x1,y1 = dot1 ; x2,y2 = dot2
    v1 = x1**2 + y1**2 ; l1 = Math.sqrt(v1)
    v2 = x2**2 + y2**2 ; l2 = Math.sqrt(v2)
    v3 = (x1-x2)**2 + (y1-y2)**2 ; l3 = Math.sqrt(v3)

    v = [v1,v2,v3].sort
    l = [l1,l2,l3].sort
    return true if (l[0] + l[1] > l[2]) && (v[2] === v[0] + v[1])
    return false
  end
end

p Problem91.find_ans