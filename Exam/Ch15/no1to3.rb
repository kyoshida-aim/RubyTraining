# frozen_string_literal: true

# exam no.1
wday =
  { sunday:    '日曜日',
    monday:    '月曜日',
    tuesday:   '火曜日',
    wednesday: '水曜日',
    thursday:  '木曜日',
    friday:    '金曜日',
    saturday:  '土曜日' }

puts '問1'
p wday[:sunday]
p wday[:monday]
p wday[:saturday]
puts ''

# exam no.2
puts '問2'
puts "ハッシュのサイズ:#{wday.size}"
puts ''

# exam no.3
wday.each { |k, v| puts "「#{k}」は#{v}のことです" }
