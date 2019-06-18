# frozen_string_literal: true

require 'date'

today = Date.today
birthday = Date.new(1993, 2, 24)
age = today.year - birthday.year
# yday returns date as 1-366(Integer)
age -= 1 if today.yday < birthday.yday

puts "今日の日付: #{today}"
puts "rubyの誕生日: #{birthday}"
puts "rubyの年齢: #{age}"
