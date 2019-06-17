# frozen_string_literal: true

def count_chars(filename)
  File.read(filename).gsub(/\n/, '').size
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  begin
    puts "#{filename}の文字数:#{count_chars(filename)}"
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル[#{filename}]を開けません"
  end
end
