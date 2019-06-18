# frozen_string_literal: true

if $PROGRAM_NAME == __FILE__
  text = 'こんにちは'
  filename = 'shift_jis_text.txt'
  File.open(filename, 'w:Shift_JIS') do |file|
    file.write(text)
  end
  puts 'Shift_JISでの表示：'
  file = File.open(filename, 'r:Shift_JIS')
  p file.read.encode('UTF-8')
  file.close
  puts 'コマンド「p」での表示：'
  p File.read(filename).encode('UTF-8')
  puts 'コマンド「puts」での表示：'
  puts File.read(filename).encode('UTF-8')
  File.delete(filename)
end
