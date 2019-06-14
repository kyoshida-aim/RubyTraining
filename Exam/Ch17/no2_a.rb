# frozen_string_literal: true

require_relative './create_path'

def reverse_lines(filename)
  text = File.read(filename).split(/\n/).reverse
  new_filename = create_path(filename, '_reverse')
  File.open(new_filename, 'w') do |file|
    text.each do |line|
      # puts will insert LF even if the string was the last line of it.
      line == text.last ? file.write(line) : file.puts(line)
    end
  end
  text
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  puts "#{filename}の行を逆順に並び替えました:"
  puts reverse_lines(filename)
end
