# frozen_string_literal: true

# exam no.6

ary = (1..100).to_a
result = []

10.times do |i|
  result << ary[i * 10, 10]
end

puts '問6.aの配列を10個ずつに分割'
p result
