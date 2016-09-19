# Ruby 입니다.
=begin
  ** 조건2를 만족하는가? => condition2? :: 조건1을 만족하는가? => condition1? 함수를 정의하였습니다.
  루비는 combination이 내장함수로 있어서 알기 쉽네요.
=end

class Problem105
  def self.find_ans
    sum = 0
    f = File.open('105nums.txt')

    f.each_line do |line|
      p line
      target = line.chomp.split(',').map{ |e| e.to_i }
      sum += target.inject(:+) if condition1?(target) && condition2?(target)
    end

    return sum
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