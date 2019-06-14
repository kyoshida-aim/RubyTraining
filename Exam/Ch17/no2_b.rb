# frozen_string_literal: true

require_relative './create_path'

def first_line(filename)
  text = File.read(filename).split(/\n/).first
  new_filename = create_path(filename, '_first_line')
  File.write(new_filename, text)
  text
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  text = first_line(filename)
  puts "#{filename}の最初の一行だけ取得しました:\n#{text}"
end
