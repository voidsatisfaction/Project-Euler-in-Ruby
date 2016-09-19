# Ruby 입니다.
# 삼각수인지 확인하는 메소드와, 문자값을 구하는 메소드를 이용하여 풀었습니다.

# first way :: you can check each of word_value whether it is tri_word or not >> slow
# second way :: you can make tri_num array to check whether certain word is tri word or not >> fast but where is limitation?

# variables
num = 0

# functions
def tri_word?(word_value)
  i = 1
  while 1
    tri_value = 1.0/2.0 * i * (i+1)
    if tri_value > word_value
      return false
    elsif tri_value === word_value
      return true
    else
      i += 1
    end
  end
end

def get_word_value_array
  word_value_array = Array.new
  f = File.open('42_word.txt')
  f.each_line do |line|
    line.gsub("\"","").split(",").each do |word| # open(filename){ |f| return f.read.gsub("\"", "").split(",") }
      word_value = 0
      0.upto(word.length-1){ |index|
        word_value += word[index].ord - 64
      }
      word_value_array << word_value
    end
  end
  return word_value_array
end

# main

get_word_value_array.each do |word_value|
  if tri_word?(word_value)
    num += 1
  end
end

p num