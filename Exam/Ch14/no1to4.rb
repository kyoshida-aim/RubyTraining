# frozen_string_literal: true

# exam no.1
str = 'Ruby is an object oriented programming language'

ary = str.split(' ')

puts '問1'
p ary

# exam no.2
ary.sort!

puts '問2'
p ary

# exam no.3
ary.sort! { |a, b| a.downcase <=> b.downcase }

puts '問3'
p ary

# exam no.4
count_hash = {}
str.each_char do |i|
  count_hash[i] ||= ''
  count_hash[i] += '*'
end

count_array = count_hash.to_a
count_array.sort!
puts '問4'
count_array.each { |item| puts %("#{item[0]}": #{item[1]}) }
