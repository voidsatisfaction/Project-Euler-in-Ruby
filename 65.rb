# Ruby 입니다.
=begin
  ** 최종목표로서, num번째 연분수의 계산한 분자 분모값을 구하는 함수를 만듭니다. (self.getPartialValue)
  그를 위해서
  1) 먼저, num번째 연분수의 연분수꼴 e_array를 구합니다
  2) 점화식의 형태로 하나하나 뒤에서부터 역으로 계산해나갑니다.
  3) 답을 출력합니다.
=end

class Problem65
  def self.find_ans
    sum = 0
    getPartialValue(100)[0].to_s.split('').each { |ele| sum += ele.to_i }
    sum
  end

  def self.getPartialValue(num)
    e_array = Array.new(num-1, 1).unshift(2).map.with_index do |e,index|
      if index % 3 === 2
        e = 2*(index/3 + 1)
      else
        e = e
      end
    end
    e_array[-1] = [1,e_array[-1]]

    (num-1).times do
      numer, deno, former = e_array[-1][0], e_array[-1][1], e_array[-2]
      n_numer, n_deno = deno, former * deno + numer
      e_array.pop
      e_array[-1] = [n_numer, n_deno]
    end
    e_array[0].reverse!
  end
end

p Problem65.find_ans