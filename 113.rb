# Ruby 입니다.
=begin
  점화식 + Dynamic Programming의 개념을 응용했습니다.

  답 = 증가수 총합 + 감소수 총합 - 9*자리수(DIGITS)(왜냐하면 증가수와 감소수가 동시에 되는 수가 있습니다.)
  이제 증가수와 감소수를 구하면 되는데, 1부터 bruteforce를 하는 것은 매우 비효율적이므로, 자리수를 분석합니다.(digits)

  digits = 1 의 경우
  1 2 3 4 5 6 7 8 9 로 대응되는 경우의 수 배열을 상정하면
  [1,1,1,1,1,1,1,1,1] => sum = 9
  이 됩니다.

  digits = 2 의경우
  [1,2,3,4,5,6,7,8,9]가 됩니다. sum = 9 + 45

  digits = 3 의경우
  [1,3,6,10, .. 45]가 됩니다. sum = 9 + 45 + ?

  위의 프로세스를 100까지 반복하면 증가수의 총 개수 sum을 구할 수 있고 감소수도 마찬가지로 해주면 됩니다.
  대신 감소수는 0을 포함할 수 있는 경우까지 고려해야합니다.
=end
class Problem113
  DIGITS = 100

  def self.find_ans
    number_of(:increase,DIGITS) + number_of(:decrease,DIGITS) - 9 * DIGITS
  end

  def self.number_of(select,digits) # increase? decrease?
    ary_length = select === :increase ? 9 : 10
    array =  Array.new(ary_length,1)
    sum = 9

    (digits-1).times do |index|
      1.upto(ary_length-1) do |i|
        if i === 0
          array[0] = 1
        else
          array[i] += array[i-1]
        end
      end

      sum += array.reduce(:+)
    end

    select === :increase ? sum : sum - (digits - 1)
  end
end
start = Time.now
p Problem113.find_ans
finish = Time.now

p finish - start
