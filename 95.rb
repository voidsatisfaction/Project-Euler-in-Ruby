# Ruby 입니다.
=begin
  ** {"숫자" => 길이 } >> 이런 해쉬를 하나 만들어서 데이터를 저장하면서 문제를 풀어갑니다.
  아무래도 계산 시간을 단축하는 것이 핵심 같은데, 생각보다 오래걸리네요 ㅠㅠ
  1) 어떤 수를 2부터 10**6 까지 알아봅니다.
  2) 그 알아보는 내용은 계속해서 다음 수를 구해가면서 getNext(num)
  3) 그것이 1.친화 계열수인지(완전수, 우애수, 친화고리수 첫번째 이프) 2. 아무것도 아닌 수인지(두, 세번째 이프) 3. 아직 모르는 수(계산도중)인지(마지막 이프) 나눠갑니다.
  4) 가장 긴 수를 구해 답을 구합니다.
=end

require 'prime'

class Problem95
  def self.find_ans
    dic = {} # "num" => "length of rings"
    trash = {}

    2.upto(10**6) do |target|
      p target
      next if target.prime? || dic.has_key?(target) || trash.has_key?(target)
      temp = [target] ; cnt = 1
      while 1
        target = getNext(target)
        break if target.prime? || target > 10**6
        if target === temp[0]
          dic["#{target}"] = cnt
          break
        elsif trash.has_key?("#{target}")
          break
        elsif dic.has_key?("#{target}")
          trash["#{target}"] = 0
          break
        elsif temp.include?(target)
          trash["#{target}"] = 0
          dic["#{target}"] = cnt - temp.index(target) - 1
          break
        else
          temp << target
          cnt += 1
        end
      end
    end
    ans,counts = dic.max_by {|_, v| v }
    getAns(ans.to_i)
  end

  def self.getNext(num)
    nextNum = 0
    1.upto(Math.sqrt(num)) do |divisor|
      if num % divisor === 0
        nextNum += divisor
        nextNum += num/divisor if divisor**2 != num && divisor != 1
      end
    end
    nextNum
  end

  def self.getAns(target)
    first = target
    challenger = 0
    king = 10**6
    while challenger != first
      target = getNext(target)
      challenger = target
      king = challenger if target < king
    end
    king
  end
end

p Problem95.find_ans