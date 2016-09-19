# Ruby 입니다.

class Problem79
  def self.find_ans
    # numArray 배열에 파일을 읽어들여서 처음오는 수, 중간에 오는수, 마지막에 오는 수를 구함
    candidates = [] ; answer = []
    numArray = [[],[],[]]
    f = File.open('keylog79.txt')
    f.each_line do |line|
      0.upto(2){ |i| numArray[i] << line[i] }
    end
    numArray.each{ |array| array.uniq!.sort! }
    candidates = (numArray[0] + numArray[1] + numArray[2]).uniq.map{ |e| e.to_i }

    # The first and the last number are numbers not used at last and at first
    first_num = (numArray[0] - numArray[1] - numArray[2]).join.to_i
    last_num = (numArray[2] - numArray[1] - numArray[0]).join.to_i

    newCandidates = []
    f = File.open('keylog79.txt')
    f.each_line.with_index do |line, index|
      if index === 0
        newCandidates = candidates - [first_num, last_num, line[0].to_i, line[1].to_i, line[2].to_i]
        answer = [first_num,newCandidates,line[0].to_i,newCandidates,line[1].to_i,newCandidates,line[2].to_i,newCandidates,last_num]
        # The first number is inserted
      end
      answer = analyze(line, answer)
    end
    answer.delete_if{ |e| e === [] }
  end

  def self.analyze(line, answer)
    inserted = [3,1,9]
    v1 = line[0].to_i ; v2 = line[1].to_i ; v3 = line[2].to_i
    line.chomp.split('').each_with_index do |target, index|
      target = target.to_i
      # exclude decided first number and last number
      next if target === answer[0] || target === answer[-1]
      # case of 3,1,9 is existed in readed line
      if inserted.include?(target)
        t_index = answer.index(target)
        case index
        when 0
          i = 1
          while t_index - i > 0
            answer[t_index-i] -= [v2,v3]
            i += 2
          end
        when 1
          i = 1
          while t_index - i > 0
            answer[t_index-i] -= [v2]
            i += 2
          end
          t = 1
          while t_index + t < answer.length
            answer[t_index+t] -= [v1]
            t += 2
          end
        else
          t = 1
          while t_index + t < answer.length
            answer[t_index+t] -= [v1,v2]
            t += 2
          end
        end
      end
    end
    # self sorting
    answer
  end
end

p Problem79.find_ans