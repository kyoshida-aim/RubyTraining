# frozen_string_literal: true

def count_lines(filename)
  File.read(filename).split(/\n/).size
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  begin
    puts "#{filename}の行数:#{count_lines(filename)}"
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル[#{filename}]を開けません"
  end
end
