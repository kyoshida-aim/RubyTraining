# frozen_string_literal: true

require 'open-uri'

url = 'https://www.aozora.gr.jp/cards/001779/files/56647_58167.html'
filename = 'nisendouka.html'

File.open(filename, 'wb') do |f|
  text = open(url, 'r:shift_jis').read
  # f.write(text) # use this in Shift_JIS env
  f.write(text.encode('utf-8')) # use this in UTF-8 env
end
