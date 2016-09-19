
class Problem98
  def self.find_ans
    answer = []
    nums = (0..9).to_a
    anagrams = getAnagramSet
    anagrams.each do |wordSet|
      p wordSet
      size = wordSet[0].length
      next if size < 4 || size > 7
      candidates = nums.permutation(size).to_a.delete_if{ |ele| ele[0] === 0 || Math.sqrt(ele.join.to_i).ceil != Math.sqrt(ele.join.to_i).floor }

      candidates.each do |numSet|
        temp = {}
        wordSet[0].split('').each_with_index do |cha,index|
          temp[cha] = numSet[index]
        end

        changedNum = ""
        wordSet[1].split('').each do |cha|
          changedNum += temp[cha].to_s
        end

        answer << [numSet.join.to_i,changedNum.to_i] if Math.sqrt(changedNum.to_i).ceil === Math.sqrt(changedNum.to_i).floor
      end
      p answer
    end
    answer.delete_if{ |e| e[0].to_s.length != e[1].to_s.length }.flatten.max

  end

  def self.getAnagramSet
    anagrams = []
    f = File.open('98nums.txt')
    words = f.read.gsub('"','').split(',')
    words.each_with_index do |word,i1|
      (i1+1).upto(words.length-1) do |i2|
        anagrams << [word,words[i2]] if word.split('').sort === words[i2].split('').sort && word.reverse != words[i2]
      end
    end
    anagrams
  end
end

p Problem98.find_ans
