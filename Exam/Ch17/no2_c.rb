# frozen_string_literal: true

require_relative './create_path'

def last_line(filename)
  text = File.read(filename).split(/\n/).last
  new_filename = create_path(filename, '_last_line')
  File.write(new_filename, text)
  text
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  text = last_line(filename)
  puts "#{filename}の最後の一行だけ取得しました:\n#{text}"
end
