# frozen_string_literal: true

require_relative './create_path'
require_relative './txtfile2ary'

def first_line(filename, save_at:)
  text = txtfile2ary(filename)
  File.write(save_at, text.first)
  File.read(save_at)
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  new_filename = create_file(filename, '_first_line')
  text = first_line(filename, save_at: new_filename)
  begin
    puts "#{filename}の最初の一行だけ取得しました:#{new_filename}\n#{text}"
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル[#{filename}]または#{new_filename}にアクセスできません"
  end
end
