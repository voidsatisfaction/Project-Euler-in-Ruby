# 루비 입니다. 시간이 너무 오래걸리네요. 4초정도 걸려요. 개량해야할 것 같아요.

# variables
king_list = Array.new
king = 0
p = 0

# functions

# main

4.upto(1000){|p|
  p_list = Array.new
  for a in (1..p/3)
    for b in (p/2-a+1..p/2)
      c = p - a - b
      if b > a && a**2 + b**2 === c**2
        p_list << [a,b,c]
      end
    end
  end
  if p_list.length >= king
    king = p_list.length
    king_list = p_list
  end
}

king_list[0].each do |x|
  p += x
end

p p, king_list

