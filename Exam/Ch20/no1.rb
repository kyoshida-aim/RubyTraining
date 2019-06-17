# frozen_string_literal: true

require 'date'

today = Date.today
ruby_birthday = Date.new(1993, 2, 24)
ruby_age = today.year - ruby_birthday.year
ruby_age -= 1 if today.yday < ruby_birthday.yday

puts "今日の日付: #{today}"
puts "rubyの誕生日: #{ruby_birthday}"
puts "rubyの年齢: #{ruby_age}"
