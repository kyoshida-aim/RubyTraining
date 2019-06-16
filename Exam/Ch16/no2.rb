# frozen_string_literal: true

regexp_is_hard = '正規表現は難しい! なんて難しいんだ！'
regexp_is_easy = regexp_is_hard.gsub('難しいんだ', '簡単なんだ').gsub('難しい', '簡単だ')

puts "変換前:#{regexp_is_hard}"
puts "変換後:#{regexp_is_easy}"
