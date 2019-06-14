# frozen_string_literal: false

module Investigate
  module_function

  def write_in_file(filename)
    result = []
    previous_filesize = 0
    file = File.open(filename, 'w')
    while result.size < 10
      file.write('.')
      filesize = File.size(filename)
      if filesize > previous_filesize
        result << filesize - previous_filesize
        previous_filesize = filesize
      end
    end
    file.close
    result
  end
end

if $PROGRAM_NAME == __FILE__ && ARGV[0]
  filename = ARGV[0]
  begin
    p Investigate.buffer_size(filename)
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル名[#{filename}]を開けません"
  end
end
