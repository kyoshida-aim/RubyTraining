# frozen_string_literal: true

# this script checks simple benchmark.

require 'csv'

if $PROGRAM_NAME == __FILE__
  code = ARGV[0]
  start_time = Time.now

  CSV.open('KEN_ALL.CSV', 'r') do |csv|
    csv.each do |record|
      puts record.join(' ') if record[2] == code
    end
  end

  puts "実行時間: #{Time.now - start_time}"
end
