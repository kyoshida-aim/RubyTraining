
require './jzipcode_original'

jzipcode = JZipCode.new('jzipcode.db')
jzipcode.create('KEN_ALL.CSV')

puts jzipcode.find_by_code('3510025')
puts jzipcode.find_by_address('埼玉県朝霞市')
