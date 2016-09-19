
class Problem102
  def self.find_ans
    cnt = 0
    f = File.open('102nums.txt')
    f.each_line do |line|
      dots = []
      num_ary = line.chomp.split(',').map{ |e| e.to_i }
      for i in [0,2,4]
        dots << num_ary[i..i+1]
      end

      cnt += 1 if inside?(dots[0],dots[1],dots[2])
    end
    cnt
  end

  def self.inside?(*dots)
    lines = [] ; lines0 = [] ; length = []
    dots.each_with_index do |dot,index| # line >> reverse side
      x1,y1 = *dots[index - 1]
      x2,y2 = *dots[index - 2]
      slope = (y2-y1).to_f/(x2-x1)
      lines << [slope, slope*x1 - y1]
      length << Math.sqrt((x2-x1)**2 + (y2-y1)**2)
    end

    lines.each{ |line| lines0 << [-1/line[0], 0] }
    
    foots = []
    0.upto(2) do |i|
      a,b = lines[i][0],lines[i][1]
      c,d = lines0[i][0],lines0[i][1]
      foots << [-(b-d).to_f/(a-c), -c*(b-d).to_f/(a-c)]
    end

    height = []
    foots.each{ |foot| height << Math.sqrt(foot[0]**2 + foot[1]**2) }

    area = 0
    0.upto(2){ |i| area += length[i] * height[i] / 2 }

    return (heron(*dots) - area).abs < 10**(-5)
  end

  def self.heron(*dots)
    length = []
    dots.each_with_index do |dot,index|
      x1,y1 = *dots[index-1]
      x2,y2 = *dots[index-2]
      length << Math.sqrt((x2-x1)**2 + (y2-y1)**2)
    end

    a,b,c = *length
    s = (a+b+c)/2

    return Math.sqrt(s*(s-a)*(s-b)*(s-c))
  end
end

p Problem102.find_ans