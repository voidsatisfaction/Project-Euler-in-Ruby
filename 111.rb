require 'prime'

class Problem111
  def self.find_ans

  end

  def self.s(n,d)
    storage = []

    0.upto(n-1) do |aindex|
      0.upto(9) do |a|
        next if (a === d) || (a === 0 and aindex === 0)
        init = Array.new(n-1){ d }

        target = init.insert(aindex,a).join.chomp.to_i

        storage << target if target.prime? and target > 10**(n-1)
      end
    end

    return storage.reduce(:+) if storage.length > 0

    0.upto(n-1) do |aindex|
      aindex.upto(n-1) do |bindex|
        0.upto(9) do |a|
          next if (a === d)
          0.upto(9) do |b|
            init = Array.new(n-2){ d }
            next if (a === 0 and aindex === 0) || (b === 0 and bindex === 0) || b === d

            target = init.insert(aindex,a)
            target = target.insert(bindex,b).join.chomp.to_i

            storage << target if target.prime? and target > 10**(n-1)
          end
        end
      end
    end

    storage.uniq.reduce(:+)
  end
end

ans = 0

0.upto(9) do |d|
  ans += p Problem111.s(10,d)
end

p ans
