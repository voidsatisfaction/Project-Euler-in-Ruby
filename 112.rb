
class Problem112
  def self.find_ans
    cnt = 0
    i = 1
    while 1
      cnt += 1 if !(i.to_s === i.to_s.split('').sort.join) && !(i.to_s === i.to_s.split('').sort{ |a,b| b <=> a }.join)
      return i if cnt.to_f/i === 0.99
      i += 1
    end
  end

  def bouncy?(num)
    size = num.to_s.length
    (size-1).downto(0) do |i|
      backnum, num = num % 10, num/10
      frontnum = num % 10
  end
end

p Problem112.find_ans