# frozen_string_literal: true

def total(from, to)
  result = 0
  from.upto(to) do |num|
    result +=
      if block_given?
        yield(num)
      else
        num
      end
  end
  result
end

p total(1, 10)
p total(1, 10) { |num| num**2 }
