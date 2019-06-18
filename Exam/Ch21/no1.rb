# frozen_string_literal: true

def my_collect(obj, &block)
  new_ary = []
  obj.each do |item|
    new_ary <<
      if block
        block.call(item)
      else
        item
      end
  end
  new_ary
end

ary = my_collect([1, 2, 3, 4, 5]) do |i|
  i * 2
end
p ary #=> [2, 4, 6, 8, 10]

ary2 = my_collect([1, 2, 3, 4, 5])
p ary2 #=> [1, 2, 3, 4, 5]
