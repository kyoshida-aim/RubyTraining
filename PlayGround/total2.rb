# frozen_string_literal: true

def total2(from, to, &blockname)
  result = 0
  from.upto(to) do |num|
    result +=
      if blockname
        yield(num)
      else
        num
      end
  end
  result
end

p total2(1, 10)
p total2(1, 10) { |num| num**2 }
