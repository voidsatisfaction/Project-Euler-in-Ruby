=begin
  1) 1 자리수 : 12222
  2) 2 자리수 : 2223
  3) 3 자리수 : 333
  4) 4 자리수 : 45
=end

# setting

# variables

# functions
def find_ans
  pandigi_can = Array.new
  candidates = [[5,9],[25,33],[100,333],[5000,9999]]
  candidates.each do |can|
    pandigi_can << case_search(can)
  end
  pandigi_can.flatten.max
end

def pandigital?(string)
  candidate = string.split('').sort
  return true if (1..9).to_a.map{ |ele| ele.to_s } === candidate
  return false
end

def case_search(can)
  candidates = Array.new
  can[0].upto(can[1]){ |num|
    value = String.new
    i = 1
    while true
      value += (num * i).to_s
      if value.length > 9
        break
      elsif pandigital?(value)
        candidates << value
        break
      end
      i += 1
    end
  }
  return candidates
end

# main

p find_ans