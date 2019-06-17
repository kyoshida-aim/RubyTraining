# frozen_string_literal: true

if $PROGRAM_NAME == __FILE__
  text = 'こんにちは'
  filename = 'shift_jis_text.txt'
  File.open(filename, 'w:Shift_JIS') do |file|
    file.write(text)
  end
  p File.read(filename).encode('UTF-8')
end
