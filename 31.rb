# Ruby 입니다. 이런 풀이는 컴퓨터에게 배려하지 못한것 같네요...

# explanation

# functions
def find_ans
  count = 0
  0.upto(1){ |a|
    0.upto(2){ |b|
      0.upto(4){ |c|
        0.upto(10){ |d|
          0.upto(20){ |e|
            0.upto(40){ |f|
              0.upto(100){ |g|
                value = 200*a + 100*b + 50*c + 20*d + 10*e + 5*f + 2*g
                if value <= 200
                  count += 1
                  next
                elsif value > 200
                  break
                end
              }
            }
          }
        }
      }
    }
  }
  count
end

# main

p find_ans