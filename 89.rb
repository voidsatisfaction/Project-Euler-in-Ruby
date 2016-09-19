# Ruby 입니다.
=begin
  ** 로마숫자 >> 십진수 >> 최적화된 로마숫자 의 방식으로 문제를 풀었습니다.
  로마숫자 >> 십진수 : romanToDec
  십진수 >> 로마숫자 : decToRoman
  리팩토링이 필요합니다.
=end

class Problem89
  def self.find_ans
    cnt = 0

    f = File.open('89nums.txt')
    f.each_line do |line|
      target = line.chomp
      p target
      cnt += target.length - decToroman(romanToDec(target)).length
    end

    cnt
  end

  def self.romanToDec(roman)
    value = 0
    rule = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
    romanindi = roman.split('')
    romanindi.each_with_index do |romnum,i|
      if i === romanindi.length-1 || rule[romnum] >= rule[romanindi[i+1]] # Last romanumber is just plused.
        value += rule[romnum]
      else
        value -= rule[romnum]
      end
    end
    value
  end

  def self.decToRoman(dec) # 수정 필요
    result = "" ; temp = dec.to_s.split('').map{ |e| e.to_i } ; numtemp = []
    numtemp << temp[-3] ; numtemp << temp[-2] ; numtemp << temp[-1]
    nums = [1000,500,100,50,10,5,1] ; roman = ["M","D","C","L","X","V","I"]
    0.upto(nums.length-1) do |i|
      p dec, result
      div = nums[i]
      quo,dec = dec.divmod(div)
      if i === 1 && numtemp[0] === 9
        result += "CM"
        dec -= 400
        i += 1
      elsif i === 2 && numtemp[0] === 4
        result += "CD"
      elsif i === 3 && numtemp[1] === 9
        result += "XC"
        dec -= 40
        i += 1
      elsif i === 4 && numtemp[1] === 4
        result += "XL"
      elsif i === 5 && numtemp[2] === 9
        result += "IX"
        dec -= 4
        i += 1
      elsif i === 6 && numtemp[2] === 4
        result += "IV"
      else
        result += roman[i] * quo
      end
      i += 1
    end
    result
  end
end

p Problem89.find_ans
