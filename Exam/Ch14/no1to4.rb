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
ary.sort_by!(&:downcase)

puts '問3'
p ary

# exam no.4
ary_single_char = str.split('')

ary_keys = ary_single_char.uniq
ary_keys.sort!

puts '問4'
ary_keys.each { |key| puts %("#{key}": #{'*' * ary_single_char.count(key)}) }
