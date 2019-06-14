# frozen_string_literal: true

# exam no.1
str = 'Ruby is an object oriented programming language'

words = str.split(' ')

puts '問1'
p words

# exam no.2
words.sort!

puts '問2'
p words

# exam no.3
words.sort_by!(&:downcase)

puts '問3'
p words

# exam no.4
words_single_char = str.split('')

single_char_keys = words_single_char.uniq.sort

puts '問4'
single_char_keys.each { |key| puts %("#{key}": #{'*' * words_single_char.count(key)}) }
