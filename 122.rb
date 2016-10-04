
class Problem122
  def self.find_ans
    num_arys = [[1,2]]; phase = 1; sum = 0; std = (2..200).to_a
    find_sum_until(num_arys,phase,sum,std)
  end

  def self.find_sum_until(num_arys,phase,sum,std)
    p std
    next_num_arys = []
    num_arys.each do |num_ary|
      last_num = num_ary.last
      next if 2*last_num < std[0]
      num_ary.each do |num|
        if std.include?(num)
          sum += phase
          std.delete(num)
        end
        return sum if std.empty?
        next_num_arys.push(num_ary + [num+last_num])
      end
    end
    phase += 1
    self.find_sum_until(next_num_arys,phase,sum,std)
  end
end

p Problem122.find_ans
