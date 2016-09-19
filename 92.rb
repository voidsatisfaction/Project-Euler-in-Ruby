# Ruby 입니다.
=begin
  ** 이번 문제는 얼마나 구하는 시간을 줄이느냐가 관건인 것 같습니다.
  저는 주어진 조건을 만족하도록 일일이 실행하면서 전에 배웠던 dic에다 저장하는 방법을 이용하였습니다.
  구하는 시간을 줄이기 위하여
  1) 1계산과정의 제곱수를 미리 구해놓았습니다.
  2) 배열대신 해쉬를 사용하였습니다. (그런데 왜 해쉬가 시간이 덜 들어가는지 알고 싶네요.)
  3) 2103 === 3012 임을 이용하였습니다.
  그런데도 다른 분들에 비해서 시간이 오래 걸린 것 같네요. ㅠㅠ
=end

class Problem92
  def self.find_ans
    counts = 0
    dic1 = {"1" => 0} ; dic89 = {"89" => 0}
    1.upto(10**7-1) do |target|
      p target
      temp = []
      while 1
        target = target.to_s.split('').delete_if{|e| e === "0" }.sort.join.to_i
        if dic89.has_key?("#{target}")
          temp.each{ |n| dic89["#{n}"] = 0 }
          counts += 1
          break
        elsif dic1.has_key?("#{target}")
          temp.each{ |n| dic1["#{n}"] = 0 }
          break
        else
          temp << target
          target = numCal(target)
        end
      end
    end
    counts
  end

  def self.numCal(target)
    nums = [0,1,4,9,16,25,36,49,64,81]
    sum = 0
    target = target.to_s.split('').map{ |e| e.to_i }.each{ |i| sum += nums[i] } # 계산을 일일이 하지말고 미리 값을 내어놓자.
    sum
  end
end

p Problem92.find_ans