# frozen_string_literal: true

require_relative './create_uniq_path'

# Investigate buffer usage using dummy file to write.
class Investigate
  def initialize(filename)
    @filename = filename
    @result = []
    @previous_filesize = 0
  end

  def calculate
    puts '結果:'
    write
    output_avg
    delete
  end

  private

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
    printf(
      '%<times>2d回目: %<byte>2dbyte',
      times: @result.size, byte: @result.last
    )
    puts
  end

  def output_avg
    puts "平均:#{avg}"
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
    puts "#{filename}を作成してバッファ使用量を計算します"
    buffer = Investigate.new(filename)
    buffer.calculate
  rescue Errno::ENOENT, Errno::EACCES
    puts "ファイル名[#{filename}]を開けません"
  rescue Interrupt
    File.delete(filename)
  end
end
