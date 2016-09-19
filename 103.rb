
class Problem105
  def self.find_ans
    targets = (20..50).to_a.combination(7).to_a
    sets = [] ; min = 700

    targets.each do |set|
      if condition1?(set) and condition2?(set) and set.reduce(:+) < min
        sets = set
        min = set.reduce(:+)
      end
    end

    return sets.join()
  end

  def self.condition2?(array)
    array = array.sort

    1.upto(array.length/2) do |num|
      sum1,sum2 = 0,0
      array[0..num].each{ |ele| sum1 += ele }
      array[-num..-1].each{ |ele| sum2 += ele }
      return false if sum2 >= sum1
    end

    return true
  end

  def self.condition1?(array)
    array = array.sort

    1.upto(array.length-1) do |num|
      sum_set = []
      permutation_sets = array.combination(num).map{ |e| e.sort }.uniq # must edit this part
      permutation_sets.each do |set|
        sum = set.inject(:+)
        if sum_set.include?(sum)
          $savepoint = set[0]
          return false
        else
          sum_set << sum
        end
      end
    end

    return true
  end
end

p Problem105.find_ans
