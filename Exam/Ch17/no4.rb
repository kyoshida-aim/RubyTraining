# frozen_string_literal: true

require_relative './create_uniq_path'

class Investigate
  def initialize(filename)
    @filename = filename
    @result = []
    @previous_filesize = 0
    write
    output
    delete
  end

  def write
    File.open(@filename, 'w') do |file|
      while @result.size < 10
        file.write('.')
        check_buffer(File.size(@filename))
      end
    end
  end

  def check_buffer(filesize)
    return unless filesize > @previous_filesize
    @result << filesize - @previous_filesize
    @previous_filesize = filesize
  end

  def output
    output_each
    output_avg
  end

  def output_each
    @result.each_with_index { |byte, i| puts "#{i+1}回目: #{byte}byte使用" }
  end

  def output_avg
    puts"バッファ平均:#{avg}"
  end

  def avg
    return 0 if @result.empty?

    @result.inject(:+) / @result.size
  end

  def delete
    File.delete(@filename)
  end
end

if $PROGRAM_NAME == __FILE__
  filename = create_uniq_path
  begin
    puts 'バッファ使用量を計算します'
    Investigate.new(filename)
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル名[#{filename}]を開けません"
  rescue Interrupt
    File.delete(filename)
  end
end
