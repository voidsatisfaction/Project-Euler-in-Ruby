# Ruby code
=begin
  It takes too long time to calcuate when just using brute forces
  But, deleting some elements inside the candidates is highly helpful to reduce calculating times
  My basic solution is here.

  1. Increase i from 3
  2. If i is not a prime(I used both primes cache and prime? method), just go to next
  3. If i is a prime, check each of the candidate concatenates with i or not
  3-1. While checking concatenation, if there are concatenated primes, add that to primes(cache)
  4. If i concatenates with candidate, insert the candidate added with i and inser i as well
  5. *** When answer is recreated(not 10**10), for each candidate, delete it if :: (sum of candidate's all elements) + (5-(candidate's size))*i > answer (as, answer should be smallest)
  6. Stop this process, if answer is smaller than i

  The point is 5.
  solved in 77sec
=end

require 'prime'

class Problem60
  def self.find_ans
    candidates_1 = [[3]] ; candidates_2 = [[3]]
    primes = {} ; answer = 10**10

    i = 3
    loop do
      i += 2
      p i, answer

      next if !primes.has_key?("#{i}") and !(i.prime?)

      case i % 3
      when 1
        #candidates_process(candidates_1,answer,i,primes)
        candidates_1.each do |candidate|
          candidates_1 << candidate + [i] if concatenate?(candidate,i,primes)
          answer = candidate.reduce(:+) if (candidate.length === 5) and ( answer > candidate.reduce(:+) )
        end
        candidates_1 << [i]

        candidates_1.delete_if do |candidate|
          l = candidate.length
          candidate.reduce(:+) + (5-l) * i >= answer
        end
      else
        #candidates_process(candidates_2,answer,i,primes)
        candidates_2.each do |candidate|
          candidates_2 << candidate + [i] if concatenate?(candidate,i,primes)
          answer = candidate.reduce(:+) if (candidate.length === 5) and ( answer > candidate.reduce(:+) )
        end
        candidates_2 << [i]

        candidates_2.delete_if do |candidate|
          l = candidate.length
          candidate.reduce(:+) + (5-l) * i >= answer
        end
      end

      return answer if i >= answer
    end
  end
=begin scope problem
  def self.candidates_process(candidates,answer,i,primes)
    candidates.each do |candidate|
      candidates << candidate + [i] if concatenate?(candidate,i,primes)
      answer = candidate.reduce(:+) if (candidate.length === 4) and ( answer > candidate.reduce(:+) )
    end
    candidates << [i]

    candidates.delete_if do |candidate|
      l = candidate.length
      candidate.reduce(:+) + (5-l) * i >= answer
    end
  end
=end

  def self.concatenate?(candidate,index,primes)
    candidate.each do |e|
      target1 = (e.to_s + index.to_s)
      target2 = (index.to_s + e.to_s)
      check_target1 = (primes.has_key?(target1) or target1.to_i.prime?)
      check_target2 = (primes.has_key?(target2) or target2.to_i.prime?)

      if check_target1 and check_target2
        primes[target1] = 0
        primes[target2] = 0
      elsif check_target1
        primes[target1] = 0
        return false
      elsif check_target2
        primes[target2] = 0
        return false
      else
        return false
      end
    end

    return true
  end
end

start = Time.now
p Problem60.find_ans
p Time.now - start
