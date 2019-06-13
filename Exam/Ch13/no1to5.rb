# frozen_string_literal: true

# exam no.1
a = (1..100).to_a

puts '問1.a:'
p a
puts "\n"

# exam no.2

a2 = a.collect { |i| i * 100 }

puts '問2.a2:'
p a2
puts "\n"

# exam no.3

a3 = a.select { |i| (i % 3).zero? }

puts '問3.a3:'
p a3
puts "\n"

# exam no.4

puts '問4.aの逆順:'
p a.reverse
puts "\n"

# exam no.5

puts '問5.aの要素の合計:'
p(a.inject { |total, item| total + item })
