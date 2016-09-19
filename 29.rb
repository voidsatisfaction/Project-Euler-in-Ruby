# variables
set = Array.new

# functions

# main

2.upto(100){|a|
  2.upto(100){|b|
    set << a**b
  }
}

p set.sort.uniq.length