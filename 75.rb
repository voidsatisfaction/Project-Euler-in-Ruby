=begin
  ** Wikipedia 의 원시삼각수를 구하는 공식을 참조하였습니다.
  0.8 seconds
=end
class Problem39
  def self.get_max_triangle
    limit = 1500001 ; m = 3 ; n = 1
    parameter = (m+n)*m ; table = {}
    sum = 0

    until (parameter > limit) && (n === 1)
      if parameter > limit || n === (m - 2)
        sum += insert_p(table,parameter,limit)
        m += 2
        n = 1
      elsif m.gcd(n) != 1
        n += 2
      else
        sum += insert_p(table,parameter,limit)
        n += 2
      end
      parameter = (m+n)*m
    end

    p sum
  end

  def self.insert_p(table,parameter,limit)
    sum = 0
    index = 1

    while index * parameter < limit
      value = index * parameter

      if table.has_key?(value) && table[value] === 1
        table[value] += 1
        sum -= 1
      elsif table.has_key?(value) && table[value] > 1
        table[value] += 1
      else
        table[value] = 1
        sum += 1
      end

      index += 1
    end

    sum
  end
end

start = Time.now
p Problem39.get_max_triangle
finish = Time.now
p finish-start
