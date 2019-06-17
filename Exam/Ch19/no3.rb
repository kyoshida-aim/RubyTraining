# frozen_string_literal: true

str = '①'

puts "元の文字:#{str.encode('UTF-8')}"
puts "Windows-31J:#{str.encode('Windows-31J')}"
puts "Shift_JIS:#{str.encode('Shift_JIS')}"
