# Ruby 입니다.
=begin
  방법은 두가지가 있다고 생각했습니다. 1) 2차원 배열 순열 2) 트리구조(?)
  같은 연산이 반복되므로 재귀로 풀면 쉽지않을까..? 라고 생각했는데 잘 생각이 나지 않아서 일단 답은 구할 수 있도록 코드를 구성했습니다.
  근데 진짜 재귀로 풀고 싶네요. 알게되면 수정하겠습니다.
=end

class Problem61
  def self.find_ans
    field = Array.new(5){ |i| i + 1 }.map{ |e| e+2 }.permutation(5).to_a
    candidates_of(8).each do |ele8|
      field.each do |field|# okay
        real_field = making_field(field)
          real_field = making_field(field)
          real_field[4].delete_if{ |ele| ele.to_s[2..3] != ele8.to_s[0..1] }
          real_field[4].each do |ele7|
            real_field = making_field(field)
            real_field[3].delete_if{ |ele| ele.to_s[2..3] != ele7.to_s[0..1] }
            real_field[3].each do |ele6|
              real_field = making_field(field)
              real_field[2].delete_if{ |ele| ele.to_s[2..3] != ele6.to_s[0..1] }
              real_field[2].each do |ele5|
                real_field = making_field(field)
                real_field[1].delete_if{ |ele| ele.to_s[2..3] != ele5.to_s[0..1] }
                real_field[1].each do |ele4|
                  real_field = making_field(field)
                  real_field[0].delete_if{ |ele| ele.to_s[2..3] != ele4.to_s[0..1] }
                  real_field[0].each do |ele3|
                    return ele3 + ele4 + ele5 + ele6 + ele7 + ele8 if ele3.to_s[0..1] === ele8.to_s[2..3]
                  end
                end
              end
            end
          end
      end
    end
  end

  def self.making_field(array)
    field = Array.new
    array.each do |ele|
      field << candidates_of(ele)
    end
    field
  end

  def self.candidates_of(n) # n각수의 후보군을 도출합니다.
    candidates = Array.new
    expression = {
      "3" => lambda{ |n| n*(n+1)/2 }, "4" => lambda{ |n| n**2 },
      "5" => lambda{ |n| n*(3*n-1)/2 }, "6" => lambda{ |n| n*(2*n-1) },
      "7" => lambda{ |n| n*(5*n-3)/2 }, "8" => lambda{ |n| n*(3*n-2) }
    }
    exp = expression[n.to_s]
    i = 0
    while 1
      if exp.call(i) >= 10000
        break
      elsif exp.call(i) >= 1000
        candidates << exp.call(i)
      end
      i += 1
    end
    candidates
  end

end

p Problem61.find_ans