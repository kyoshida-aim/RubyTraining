# frozen_string_literal: true

def prefix(ary, obj)
  result = []
  ary.each do |item|
    result << item
    return result if item == obj
  end
  result
end

p prefix([1, 2, 3, 4, 5], 3) #=> [1, 2, 3]
