# frozen_string_literal: true

def counter
  c = 0
  proc do
    c += 1
  end
end

# create counter `c1` and count up

c1 = counter

puts c1.call #=>1
puts c1.call #=>2
puts c1.call #=>3

# create counter `c2` and count up
c2 = counter #

puts c2.call #=>1
puts c2.call #=>2

# c1 and c2 have different local variables

puts c1.call #=>4
