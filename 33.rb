# variables
answer_set = Array.new
answer = 1

# functions
def making_candidates # 0 < x < 1 , [numerator,denominator]
  candidates = Array.new
  for x in (11..98).to_a.delete_if{ |ele| ele % 10 === 0 } # Erase element when the element is dividable by 10
    for y in ((x+1)..99).to_a.delete_if{ |ele| ele % 10 === 0 } # as x, do same thing
      if isThereSameNumber?(x,y)
        candidates << [x,y]
      end
    end
  end
  return candidates
end

def isThereSameNumber?(x,y) # if x = 14 , y = 21 it is true beacuase there is same 1 in between x and y
  x.to_s.split('').each do |x|
    y.to_s.split('').each do |y|
      if x === y
        return true
      end
    end
  end
  return false
end

def num_changer(a,b) ########## This part is imperfect
  new_a = (a.to_s.split('') - b.to_s.split(''))[0].to_f
  new_b = (b.to_s.split('') - a.to_s.split(''))[0].to_f
  return new_a/new_b
end

# main
candidates = making_candidates

candidates.each do |ele|
  if ele[0].to_f/ele[1].to_f === num_changer(*ele)
    answer_set << ele
    answer *= num_changer(*ele)
  end
end

p answer
p answer_set
