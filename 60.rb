# Ruby 입니다.
=begin
  ** 풀긴 풀었는데, 최소인지 불분명합니다. 일단은 5개가 되는 시점에서 바로 리턴했는데..
  최소가 되기 위한 조건은, 최소의 sum 보다 nextNum이 커질경우에 그 sum이 최소가 됩니다.

  방식은 brute force. 시간을 단축하기 위해서 해쉬를 썼는데도 이렇게 느리네요.. 15분걸립니다.
  * cache까지 추가해서 10분 이내로 단축시켰습니다. 그런데도 기껏해야 1만 이하의 소수 밖에 확인 할 시간이 없네요.(현실적으로)
=end

require 'prime'

class Problem60
  def self.find_ans
    candidates = {"3" => 0}
    i = 7

    while 1
      p i
      if i.prime?
        nextNum = i
      else
        i += 2
        next
      end

      storage = {} ; cache = {}
      p candidates
      candidates.each do |key,value|
        temp = key.split(' ').map{ |e| e.to_i }
        checker = true
        temp.each do |prime|
          next if cache.has_key?(prime)
          if (prime != 3 && prime % 3 != nextNum % 3) || !attachprime?(prime,nextNum)
            checker = false
            break
          end
          cache[prime] = 0
        end
        storage[key + " " + nextNum.to_s] = 0 if checker
        return key + " " + nextNum.to_s if temp.length === 4 && checker
      end
      candidates.merge!(storage)

      candidates["#{nextNum}"] = 0
      i += 2
    end

  end

  def self.attachprime?(num1,num2)
    return (num1.to_s + num2.to_s).to_i.prime? && (num2.to_s + num1.to_s).to_i.prime?
  end
end

p Problem60.find_ans
