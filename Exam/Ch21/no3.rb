# frozen_string_literal: true

def accumlator
  total = 0
  proc do |num|
    total += num
  end
end

acc = accumlator
p acc.call(1) #=> 1
p acc.call(2) #=> 3
p acc.call(3) #=> 6
p acc.call(4) #=> 10
