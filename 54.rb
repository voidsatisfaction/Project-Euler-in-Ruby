# Ruby 입니다.
=begin
  1) 매 줄 마다 입력합니다
  2) 그 줄을 player1 과 player2로 나눕니다. (separate_info)
  3) 각 플레이어의 패를 분석합니다(card_analysis) >> 이 때, 분석은 총 3 level로 이뤄집니다. (룰, 룰의 가장높은 숫자, 룰에 속하지 않는 가장 높은 숫자) >> 각각을 가중치를 부여합니다.
  4) 1,2,3차 비교를 실시합니다.
  5) 각 플레이어의 승수를 더해줍니다.
=end

# setting

# variables

# functions
def find_ans
  v1 = 0 ; v2 = 0
  f = File.open('54_result.txt')
  f.each_line do |line|
    p_1, p_2 = separate_info(line.chomp)
    result_p_1 = card_analysis(p_1)
    result_p_2 = card_analysis(p_2)
    0.upto(2){ |i|
      p result_p_1, result_p_2
      if result_p_1[i] > result_p_2[i]
        v1 += 1
        break
      elsif result_p_1[i] < result_p_2[i]
        v2 += 1
        break
      else
        next
      end
    }
  end
  v1
end

def separate_info(line)
  entire = line.split(' ')
  p_1 = entire[0..4]
  p_2 = entire[5..9]
  return p_1, p_2
end

def card_analysis(player_cards) # the result is shown as array [1: status, 2: property of status, 3: property without status]
  rule = {
    "HC" => 0, "OP" => 1, "TP" => 2, "TOK" => 3, "ST" => 4,
    "FL" => 5, "FH" => 6, "FOK" => 7, "SF" => 8, "RSF" => 9
  }

  changer = {
    "T" => "10",
    "J" => "11",
    "Q" => "12",
    "K" => "13",
    "A" => "14"
  }
  player_cards.each{ |ele|  # It is change process to adjust player's card
    if changer.include?(ele[0])
      ele[0] = changer[ele[0]]
    else
      ele[0] = "0" + ele[0]
    end
    }.sort!{ |ele1, ele2| ele1[0..1] <=> ele2[0..1] }

  nums_array = Array.new
  patterns_array = Array.new

  player_cards.each { |card|
    nums_array << card[0..1]
    patterns_array << card[2]
  }

  nums_array.map!{ |ele| ele.to_i }
  patterns_array.sort!

  result1 = "not setting yet"
  result2 = "not setting yet"
  result3 = "not setting yet"

  # check whether it is pair type or not (FOK, FH, TOK, TP, OP)

  if nums_array[0] === nums_array[3] || nums_array[1] === nums_array[4] # Four Of a Kind
    result1 = "FOK" ; result2 = nums_array[3]
    if nums_array[0] === nums_array[3]
      result3 = nums_array[4]
    else
      result3 = nums_array[0]
    end
  elsif (nums_array[0] === nums_array[2] && nums_array[3] === nums_array[4]) || (nums_array[0] === nums_array[1] && nums_array[2] === nums_array[4]) # Full House
    result1 = "FH" ; result2 = nums_array[2]
    if (nums_array[0] === nums_array[2] && nums_array[3] === nums_array[4])
      result3 = nums_array[3]
    else
      result3 = nums_array[0]
    end
  elsif nums_array[0] === nums_array[2] || nums_array[1] === nums_array[3] || nums_array[2] === nums_array[4] # Three Of a Kind
    result1 = "TOK" ; result2 = nums_array[2]
    if nums_array[0] === nums_array[2] || nums_array[1] === nums_array[3]
      result3 = nums_array[4]
    else
      result3 = nums_array[0]
    end
  elsif (nums_array[0] === nums_array[1] && nums_array[2] === nums_array[3]) || (nums_array[0] === nums_array[1] && nums_array[3] === nums_array[4]) || (nums_array[1] === nums_array[2] && nums_array[3] === nums_array[4]) # Two Pairs
    result1 = "TP" ; result2 = nums_array[3]
    if (nums_array[0] === nums_array[1] && nums_array[2] === nums_array[3])
      result3 = nums_array[4]
    elsif (nums_array[0] === nums_array[1] && nums_array[3] === nums_array[4])
      result3 = nums_array[2]
    else
      result3 = nums_array[0]
    end
  elsif nums_array[0] === nums_array[1] || nums_array[1] === nums_array[2] || nums_array[2] === nums_array[3] || nums_array[3] === nums_array[4] # One Pair
    result1 = "OP" ;
    if nums_array[0] === nums_array[1]
      result2 = nums_array[0] ; result3 = nums_array[4]
    elsif nums_array[1] === nums_array[2]
      result2 = nums_array[1] ; result3 = nums_array[4]
    elsif nums_array[2] === nums_array[3]
      result2 = nums_array[2] ; result3 = nums_array[4]
    else
      result2 = nums_array[3] ; result3 = nums_array[2]
    end
  else # no pair
    result1 = "HC" ; result2 = nums_array[4]
  end

  # Check whether it is straight or flush type or not
  if ((nums_array[0]..nums_array[4]).to_a === nums_array) && (patterns_array[0] === patterns_array[4]) && nums_array[0] === 10 && nums_array[4] === 14
    result1 = "RSF"
  elsif ((nums_array[0]..nums_array[4]).to_a === nums_array) && (patterns_array[0] === patterns_array[4])
    result1 = "SF" ; result2 = nums_array[4]
  elsif (patterns_array[0] === patterns_array[4])
    result1 = "FL" ; result2 = nums_array[4]
  elsif ((nums_array[0]..nums_array[4]).to_a === nums_array)
    result1 = "ST" ; result2 = nums_array[4]
  end

  return [rule[result1], result2, result3]
end

# main
p find_ans