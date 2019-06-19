# frozen_string_literal: true

def simple_scan(word, filename)
  return unless File.exist?(filename)

  pattern = Regexp.new(word)
  count = 0
  File.open(filename).each_line do |line|
    if pattern =~ line
      line.scan(pattern) { count += 1 }
      print(line.gsub(pattern) { |str| "<<#{str}>>" })
    end
  end
  puts "count: #{count}"
end

simple_scan(*ARGV) if $PROGRAM_NAME == __FILE__ && ARGV.size == 2
