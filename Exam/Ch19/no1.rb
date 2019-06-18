# frozen_string_literal: true

def to_utf8(str_euc, str_sjis)
  change_encode(str_euc, 'UTF-8') + change_encode(str_sjis, 'UTF-8')
end

def change_encode(str, encode_name)
  str.encode(encode_name)
end

if $PROGRAM_NAME == __FILE__ && ARGV[0] && ARGV[1]
  str_euc = change_encode(ARGV[0], 'EUC-JP')
  str_sjis = change_encode(ARGV[1], 'Shift_JIS')
  str_utf8 = to_utf8(str_euc, str_sjis)
  puts "#{str_euc} : #{str_euc.encoding}"
  puts "#{str_sjis} : #{str_sjis.encoding}"
  puts "#{str_utf8} : #{str_utf8.encoding}"
end
