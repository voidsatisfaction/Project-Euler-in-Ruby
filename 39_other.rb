=begin
  It is Ruby solution.
  I didn't use Scheme, as I don't know how to memoization with Scheme.

  Took about 0.3ms with memoization
=end

class Problem39
  def self.get_max_triangle
    limit = 1000 ; m = 3 ; n = 1
    parameter = (m+n)*m ; table = {}

    until (parameter > limit) && (n === 1)
      if parameter > limit || n === (m - 2)
        insert_p(table,parameter,limit)
        m += 2
        n = 1
      elsif m.gcd(n) != 1
        n += 2
      else
        insert_p(table,parameter,limit)
        n += 2
      end
      parameter = (m+n)*m
    end

    table.max_by{|k,v| v}
  end

  def self.insert_p(table, parameter, limit)
    index = 1

    while index * parameter < limit
      value = index * parameter
      table.has_key?(value) ? table[value] += 1 : table[value] = 1
      index += 1
    end
  end
end

start = Time.now
p Problem39.get_max_triangle
finish = Time.now
p finish-start
