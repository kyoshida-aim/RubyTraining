# frozen_string_literal: true

def count_words(filename)
  File.read(filename).split(/\s+/).size
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  begin
    puts "#{filename}の単語数:#{count_words(filename)}"
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル[#{filename}]を開けません"
  end
end
