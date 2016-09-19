$tracker = [] # row, column, value >> When you use global, you should be careful to reset it!!!

class Problem96
  def make_templates
    ans = 0 ; i = -1 ; templates = [] ; temp = []
    f = File.open('96nums.txt')
    f.each_line do |line|
      if line.chomp[0] === "G"
        templates[i] = temp if i != -1
        temp = []
        i += 1
        next
      end

      temp << line.chomp.split('').map{ |e| e.to_i }
    end
    cnt = 0

    return templates
  end

  def self.complete(sudoku_ary)
    track = false # track row, column, value => only for assuming process
    while 1
      # Logic part
      row = 0
      while row < 9
        column = 0
        while column < 9
          target = sudoku_ary[row][column]
          if target != 0 && !target.kind_of?(Array)
            column += 1
            next
          end

          $tracker << [row,column,sudoku_ary[row][column]] if track

          sudoku_ary[row][column] = input_proper_num(sudoku_ary,row,column)

          if sudoku_ary[row][column].kind_of?(Integer) && sudoku_ary[row][column] != 0
            row = -1
            break
          end

          column += 1
        end
        row += 1
      end
      # Assume part
      $cache = []
      0.upto(8) do |row|
        0.upto(8) do |column|
          target = sudoku_ary[row][column]
          next if target.kind_of?(Integer)
          if target === nil || target === []
            $tracker.each{ |e| sudoku_ary[e[0]][e[1]] = e[2] }
            $tracker = [] ; track = false
            row = -1
            break
          elsif target.length <= 2 && target.length > 0 ####
            $tracker << [row,column,sudoku_ary[row][column]]
            sudoku_ary[row][column] = proper_num_guess(sudoku_ary,row,column)
            $cache 
          end
        end
      end

      if check_ary(sudoku_ary) # End of search
        p "complete"
        $tracker = []
        return sudoku_ary
      elsif sudoku_ary.flatten.length === 81 && !check_ary(sudoku_ary)
        $tracker.each{ |e| sudoku_ary[e[0]][e[1]] = e[2] }
        $tracker = [] ; track_num = -1
      end

      track = true
    end
  end

  def self.input_proper_num(sudoku_ary,row,column)
    candidates = [1,2,3,4,5,6,7,8,9]
    # horizontal
    sudoku_ary[row].each_with_index{ |ele,index| candidates = candidates - [ele] if index != column}
    # vertical
    0.upto(8){ |i| candidates = candidates - [sudoku_ary[i][column]] }
    # 3*3 box
    if row % 3 === 0
      for y in 1..2
        case column / 3
        when 0
          (0..2).to_a.each { |ele| candidates -= [sudoku_ary[row+y][ele]] }
        when 1
          (3..5).to_a.each { |ele| candidates -= [sudoku_ary[row+y][ele]] }
        when 2
          (6..8).to_a.each { |ele| candidates -= [sudoku_ary[row+y][ele]] }
        end
      end
    elsif row % 3 === 1
      case column / 3
      when 0
        for ele in 0..2
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      when 1
        for ele in 3..5
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      when 2
        for ele in 6..8
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      end
    else # if row % 3 === 2
      for y in 1..2
        case column / 3
        when 0
          (0..2).to_a.each { |ele| candidates -= [sudoku_ary[row-y][ele]] }
        when 1
          (3..5).to_a.each { |ele| candidates -= [sudoku_ary[row-y][ele]] }
        when 2
          (6..8).to_a.each { |ele| candidates -= [sudoku_ary[row-y][ele]] }
        end
      end
    end
    if candidates.length === 1
      candidates[0]
    else
      return candidates
    end
  end

  def self.proper_num_guess(sudoku_ary,row,column)
    candidates = [1,2,3,4,5,6,7,8,9]
    # horizontal
    sudoku_ary[row].each_with_index{ |ele,index| candidates = candidates - [ele] if index != column}
    # vertical
    0.upto(8){ |i| candidates = candidates - [sudoku_ary[i][column]] }
    # 3*3 box
    if row % 3 === 0
      for y in 1..2
        case column / 3
        when 0
          for ele in 0..2
            candidates -= [sudoku_ary[row+y][ele]]
          end
        when 1
          for ele in 3..5
            candidates -= [sudoku_ary[row+y][ele]]
          end
        when 2
          for ele in 6..8
            candidates -= [sudoku_ary[row+y][ele]]
          end
        end
      end
    elsif row % 3 === 1
      case column / 3
      when 0
        for ele in 0..2
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      when 1
        for ele in 3..5
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      when 2
        for ele in 6..8
          candidates -= [sudoku_ary[row-1][ele]]
          candidates -= [sudoku_ary[row+1][ele]]
        end
      end
    else # if row % 3 === 2
      for y in 1..2
        case column / 3
        when 0
          for ele in 0..2
            candidates -= [sudoku_ary[row-y][ele]]
          end
        when 1
          for ele in 3..5
            candidates -= [sudoku_ary[row-y][ele]]
          end
        when 2
          for ele in 6..8
            candidates -= [sudoku_ary[row-y][ele]]
          end
        end
      end
    end
    if candidates.length === 1
      candidates[0]
    else
      return candidates.sample
    end
  end

  def self.check_ary(sudoku_ary) # check :: all elemets should be integer and different.
    all_integer = true
    sudoku_ary.each do |row|
      row.each do |value|
        all_integer = value.kind_of?(Integer)
        return false if row.uniq.length != 9 || all_integer === false
      end
    end
    return true
  end

end

pro = [
[8,0,0,0,0,0,0,0,0],
[0,0,3,6,0,0,0,0,0],
[0,7,0,0,9,0,2,0,0],
[0,5,0,0,0,7,0,0,0],
[0,0,0,0,4,5,7,0,0],
[0,0,0,1,0,0,0,3,0],
[0,0,1,0,0,0,0,6,8],
[0,0,8,5,0,0,0,1,0],
[0,9,0,0,0,0,4,0,0]
]

pro6 = [
[0,4,6,0,0,5,7,0,0],
[0,0,0,9,0,0,0,0,0],
[0,9,0,0,0,1,0,0,6],
[0,0,0,0,0,0,9,0,0],
[0,3,0,0,0,0,0,0,0],
[4,0,0,5,2,0,0,0,8],
[0,8,0,0,0,0,0,7,0],
[5,7,0,3,0,0,0,8,2],
[2,0,0,0,0,0,3,0,0]
]

#p Problem96.find_ans # 47 ~ not solved # There is a bug that change sudoku_array to all candidates

templates = Problem96.new.make_templates
ans = 0
#Problem96.complete(templates[1])
#0.upto(49) do |n| 
#  ans += Problem96.complete(templates[n])[0][0..2].join.to_i
#  p "#{n} Problem is completed", ans
#end

p Problem96.complete(pro6)