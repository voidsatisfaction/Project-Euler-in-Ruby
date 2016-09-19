# variables

king = 0
king_n = 0

# fuctions

def hailstone(n)
  if n % 2 === 0
    n = n/2
  else
    n = 3*n + 1
  end
  return n
end

# main

1000000.downto(1){|n|
  c = 0
  challenger_n = n
  while n != 1
    n = hailstone(n)
    c += 1
  end
  if c > king
    king = c
    king_n = challenger_n
  end
}

p king_n
