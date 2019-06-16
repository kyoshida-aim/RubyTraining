# frozen_string_literal: true

require_relative './txtfile2ary'

def tail(line_num, filename)
  raise '行数が負の値です' if line_num.negative?

  text_ary = txtfile2ary(filename)
  raise '行数がファイルの行数を超えています' if line_num > text_ary.size

  index  = -line_num - 1
  length = line_num + 1
  text_ary[index, length]
end

if $PROGRAM_NAME == __FILE__ && ARGV[0] && ARGV[1]
  raise "#{ARGV[0]}は数字ではありません" if ARGV[0] != '0' && ARGV[0].to_i.zero?

  line_num = ARGV[0].to_i
  filename = ARGV[1]
  begin
    puts "後ろから#{line_num}行目以降の行を表示します：\n"
    tail(line_num, filename).each { |line| puts line }
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル名[#{filename}]を開けません"
  end
end
