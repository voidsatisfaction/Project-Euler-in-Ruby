# Ruby 입니다.
=begin
  # 방법 1
  자리수합 = 원래수**(1/n)임에 착안합니다.
  위 사실에서, 원래수를 자리수합으로 계속 나누어 "원래수**(1/k) = 자리수합"일때 이는 수열 a에 속한다고 볼 수 있고,
  a[30]을 구할때까지 위의 조건을 만족하는 수를 구합니다.
  하지만 이 방법은 11부터 모든 수를 고려해야하므로 비효율적입니다.

  # 방법 2
  합의 범위에 착안합니다.
  두자리수 : 2 ~ 18(1은 제외)
  세자리수 : 2 ~ 27
  네자리수 : 2 ~ 36
  이와같이 n자리수의 자리수합의 범위는 2 ~ 9*n 입니다.

  그러므로, 임의의 n자리수의 합의 범위가 매우 한정되어있으므로, 범위 내의 수들을 거듭제곱해서 조건을 만족할 가능성이 있는 n자리수의 수의 후보들을 구합니다.
  이 후보들중에서
  1. 임의의 n자리수와 자리수가 같으며,
  2. 자리수의 합이 이 수를 구하기 위한 합과 같아야하고,
  3. 자리수의 합의 제곱이 원래의 수와 같은

  위의 조건에 맞는 수들은 sequence에 포함시켜 sequence의 배열이 원소가 30개가 넘을때까지 구한 후,
  sort시켜서 답을 구하면 됩니다.

  Took about 0.2sec
=end
class Problem119
  def self.sequence(length)
    sequence = []
    digits = 2
    until sequence.length >= length
      sum_range = (2..(9*digits)).to_a
      sum_range.each do |sum|
        target = sum
        while target.to_s.split('').length <= digits
          target_length = target.to_s.split('').length
          target_digit_sum = target.to_s.split('').map{ |e| e.to_i }.reduce(:+)

          sequence.push(target) if target_length === digits && target_digit_sum === sum && square?(target_digit_sum,target)

          target *= sum
        end
      end
      digits += 1
    end

    sequence.sort[length-1]
  end

  def self.square?(digit_sum,num)
    until digit_sum === num
      return false if num % digit_sum != 0
      num /= digit_sum
    end
    return true
  end
end

start = Time.now
p Problem119.sequence(30)
p Time.now - start
