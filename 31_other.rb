class Problem_31
  MONEY = [2,5,10,20,50,100,200]

  def self.find_ans
    sum = (0..200).to_a.map{ |ele| 1 }
    MONEY.each { |i| (i..200).each { |j| sum[j] += sum[j-i] }}
    sum
  end
end

p Problem_31.find_ans