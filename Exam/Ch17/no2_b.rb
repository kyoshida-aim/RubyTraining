# frozen_string_literal: true

require_relative './create_path'

def first_line(filename, save_at:)
  text = File.read(filename).split(/\n/).first
  File.write(save_at, text)
  text
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  new_filename = create_path(filename, '_first_line')
  text = first_line(filename, save_at: new_filename)
  puts "#{filename}の最初の一行だけ取得しました:#{new_filename}\n#{text}"
end
