
class Problem78
  def self.find_ans
    target = 2
    coin = []
    while 1
      p target
      counts = Array.new(target+1,1)
      coin << target
      coin.each do |k|
        counts.each_with_index do |oldcnt, index|
          oldcnt %= 10**6
          counts[index] = oldcnt + counts[index - k] if index - k >= 0
        end
      end
      return (counts.length-1) if counts[-1] % 10**6 === 0
      target += 1
    end
  end
end

p Problem78.find_ans