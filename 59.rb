# setting
f = File.open('59_enc.txt')

# variables

# functions
def answer(f, key)
  sum = 0
  f.each_line do |line|
  key.each do |key|
    i = 0
    line.split(',').map{ |e| e.to_i }.each do |num|
        case i % 3
        when 0
          sum += xor_process(num.to_s(2), key[0].ord.to_s(2)).to_i(2)
        when 1
          sum += xor_process(num.to_s(2), key[1].ord.to_s(2)).to_i(2)
        when 2
          sum += xor_process(num.to_s(2), key[2].ord.to_s(2)).to_i(2)
        end
      i += 1
    end
    return sum
  end
  end
end

def making_candidates(f, keys)
  f.each_line do |line|
  keys.each do |key|
    temp = Array.new
    i = 0
    line.split(',').map{ |e| e.to_i }.each do |num|
        case i % 3
        when 0
          temp << xor_process(num.to_s(2), key[0].ord.to_s(2)).to_i(2).chr
        when 1
          temp << xor_process(num.to_s(2), key[1].ord.to_s(2)).to_i(2).chr
        when 2
          temp << xor_process(num.to_s(2), key[2].ord.to_s(2)).to_i(2).chr
        end
      i += 1
    end
    return temp.join, key if !temp.include?("%") && !temp.include?("`") && !temp.include?("*") && !temp.include?("^")
  end
  end
end

def xor_process(a_2, b_2)
  until a_2.length === b_2.length
    if a_2.length > b_2.length
      b_2 = "0" + b_2
    elsif a_2.length < b_2.length
      a_2 = "0" + a_2
    end
  end

  temp = Array.new
  for x in 0..(a_2.length-1)
    if a_2[x] === b_2[x]
      temp << "0"
    else
      temp << "1"
    end
  end
  temp.join
end

def making_keys
  ("a".."z").to_a.permutation(3).to_a
end
# main



p answer(f, [["g","o","d"]])
