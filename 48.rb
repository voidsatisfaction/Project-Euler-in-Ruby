class Problem_48
  Div = 10**10

  def self.find_ans
    target_array = Array.new
    remains = 0
    1.upto(1000){ |num1|
      num2 = num1
      target_array << remains_of_tenten(num1, num2)
    }
    target_array.each { |ele| remains += ele }
    p remains % Div
  end

private
  def self.remains_of_tenten(num1, num2)
    if num1**num2 <= Div
      return (num1**num2) % Div
    else
      q,k = num2.divmod(2)
      (((remains_of_tenten(num1,q)**2) * (num1**k))) % Div
    end
  end
end

Problem_48.find_ans

