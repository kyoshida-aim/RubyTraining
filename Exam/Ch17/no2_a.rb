# frozen_string_literal: true

require_relative './create_path'
require_relative './txtfile2ary'

def reverse_lines(filename, save_at:)
  text = txtfile2ary(filename)
  File.open(save_at, 'w') do |file|
    text.reverse_each do |line|
      # puts will insert LF even if the string was the last line of it.
      line == text.first ? file.write(line) : file.puts(line)
    end
  end
  File.read(save_at)
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  new_filename = create_path(filename, '_reverse')
  begin
    puts "#{filename}の行を逆順に並び替えました:#{new_filename}"
    puts reverse_lines(filename, save_at: new_filename)
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル[#{filename}]または#{new_filename}にアクセスできません"
  end
end
