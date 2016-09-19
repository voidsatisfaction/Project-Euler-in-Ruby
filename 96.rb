
class Problem96
  def make_templates
    i = -1 ; templates = [] ; temp = []
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

  def self.complete(sudoku_ary,original_ary)
    # Logic part
    sudoku_ary,original_ary = *get_candidates(sudoku_ary,original_ary)

    # Assume part
    track = [] ; go = true ;
    while 1
      changed_ary = []
      sudoku_ary.each { |row| changed_ary += row }

      if check_ary(sudoku_ary)
        return sudoku_ary
      else
        row,column = 0,0
        changed_ary.each_with_index do |candidate,index|
          next if candidate.kind_of?(Integer)
          row,column = index.divmod(9)
          break
        end

        value = input_proper_num(sudoku_ary,row,column,sudoku_ary[row][column],"assume")

        if value
          track << [row,column,sudoku_ary[row][column],value]
          sudoku_ary[row][column] = value
          go = true
        else
          back_row,back_column,back_candidates = track[-1][0],track[-1][1],track[-1][2]
          sudoku_ary[back_row][back_column] = back_candidates - [track[-1][-1]]
          sudoku_ary[row][column] = original_ary[row][column] if !go

          track.pop
          go = false
        end
      end
    end
  end

  def self.get_candidates(*arys)
    arys.each do |ary|
      row = 0
      while row < 9
        column = 0
        while column < 9
          target = ary[row][column]
          if target != 0 && !target.kind_of?(Array)
            column += 1
            next
          end

          ary[row][column] = input_proper_num(ary,row,column,"logic")

          if ary[row][column].kind_of?(Integer) && ary[row][column] != 0
            row = -1
            break
          end

          column += 1
        end
        row += 1
      end
    end
    arys
  end

  def self.input_proper_num(sudoku_ary,row,column,*mode)
    candidates = [1,2,3,4,5,6,7,8,9]
    candidates = mode[0] if mode.length === 2
    # horizontal
    sudoku_ary[row].each_with_index{ |ele,index| candidates = candidates - [ele] if index != column}
    # vertical
    0.upto(8){ |i| candidates = candidates - [sudoku_ary[i][column]] }
    # 3*3 box
    arrange = [(0..2).to_a,(3..5).to_a,(6..8).to_a]
    val = column / 3
    if row % 3 === 0
      1.upto(2){ |y| arrange[val].each { |ele| candidates -= [sudoku_ary[row+y][ele]] } }
    elsif row % 3 === 1
      arrange[val].each do |ele|
        candidates -= [sudoku_ary[row-1][ele]]
        candidates -= [sudoku_ary[row+1][ele]]
      end
    else # if row % 3 === 2
      1.upto(2){ |y| arrange[val].each { |ele| candidates -= [sudoku_ary[row-y][ele]] } }
    end
    # return rule
    if candidates.length === 1 || mode[1] === "assume"
      candidates[0]
    else
      candidates
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

# sample
pro1 = [
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

pro2 = [
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

pro3 = [
[0,0,0,8,0,1,0,0,0],
[0,0,0,0,0,0,4,3,0],
[5,0,0,0,0,0,0,0,0],
[0,0,0,0,7,0,8,0,0],
[0,0,0,0,0,0,1,0,0],
[0,2,0,0,3,0,0,0,0],
[6,0,0,0,0,0,0,7,5],
[0,0,3,4,0,0,0,0,0],
[0,0,0,2,0,0,6,0,0]
]

pro4 = [
[0,0,0,8,0,1,0,0,0],
[0,0,0,0,0,0,4,3,0],
[5,0,0,0,0,0,0,0,0],
[0,0,0,0,7,0,8,0,0],
[0,0,0,0,0,0,1,0,0],
[0,2,0,0,3,0,0,0,0],
[6,0,0,0,0,0,0,7,5],
[0,0,3,4,0,0,0,0,0],
[0,0,0,2,0,0,6,0,0]
]

pro5 = [
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
#templates1 = Problem96.new.make_templates
#templates2 = Problem96.new.make_templates
#ans = 0

#0.upto(49) do |n|
#  ans += Problem96.complete(templates1[n],templates2[n])[0][0..2].join.to_i
#  p "#{n} Problem has been completed", ans
#end

p Problem96.complete(pro5,pro6)

