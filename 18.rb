# 루비 입니다. 아래에서 위로 올라가는 방식을 생각하였습니다.

# variables

# functons
def get_file
  triangle = Array.new
  f = File.open("18_num.txt")
  f.each_line do |line|
    triangle << line.split(' ').map{ |ele| ele.to_i }
  end
  return triangle
end

def going_back_algorithm(n,triangle)
  if triangle.length === 1
    return triangle
  else
    row_last = triangle[n] ; row_before = triangle[n-1]
    for x in 0..(row_last.length-2)
      if row_last[x] >= row_last[x+1]
        row_before[x] = row_last[x] + row_before[x]
      else
        row_before[x] = row_last[x+1] + row_before[x]
      end
      triangle[n-1][x] = row_before[x]
    end
    triangle.pop
    going_back_algorithm(n-1,triangle) # 재귀함수
  end
end

# main

triangle = get_file

n = 14
p going_back_algorithm(n,triangle)

