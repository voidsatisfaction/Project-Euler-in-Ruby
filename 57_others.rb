class Problem57
  def self.find_ans
    count = 0
    numer, deno = 3, 2
    2.upto(2) do |level|
      numer, deno = getValues{ numer, deno = numer + 2*deno, numer + deno}
      count += 1 if numer.to_s.length > deno.to_s.length
      p numer, deno
    end
    count
  end

private
  def self.getValues
    yield
  end
end

p Problem57.find_ans