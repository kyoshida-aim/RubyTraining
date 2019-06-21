
require './jzipcode'

jzipcode = JZipCode.new('jzipcode.db')
jzipcode.create('KEN_ALL.CSV')

puts '351-0025での検索結果:'
puts jzipcode.find_by_code('3510025')

puts '埼玉県朝霞市での検索結果:'
puts jzipcode.find_by_address('埼玉県朝霞市')
