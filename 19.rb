# Ruby입니다. 해 년 월 일을 숫자(index)로 변환하였습니다. 그리고 7 로 나눈 나머지로 요일을 구하였습니다.

# variables

# functions
def leap_year?(yy) # check whether it is leap month or not
  if (yy % 4 === 0) && (yy % 100 === 0) && (yy % 400 != 0)
    return false
  elsif yy % 4 === 0
    return true
  else
    return false
  end
end

def year_to_num(yy)
  sum = 0
  1900.upto(yy-1){ |n|
    if leap_year?(n)
      sum += 366
    else
      sum += 365
    end
  }
  return sum
end

def month_to_num(yy,mm,year)
  sum = 0
  1.upto(mm-1){ |n|
    sum += year[n-1]
  }
  return sum
end

def day_of_week(yy,mm,dd) # find the day of week in yy,mm,dd(ex 2016 4 21)
  week = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"]
  year = [31,28,31,30,31,30,31,31,30,31,30,31]
  if leap_year?(yy)
    year = [31,29,31,30,31,30,31,31,30,31,30,31]
  end

  index = (year_to_num(yy) + month_to_num(yy,mm,year) + dd) % 7
  return week[index]
end

# main

count = 0
(1901..2000).each do |yy|
  (1..12).each do |mm|
    dd = 1
    if day_of_week(yy,mm,dd) === "sunday"
      count += 1
    end
  end
end

p count