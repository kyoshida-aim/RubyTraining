# frozen_string_literal: true

# this class will contain novel text for word counting
class Novel
  def initialize(filename, len = 5)
    raise Errno::ENOENT unless File.exist?(filename)

    @filename = filename
    @len = len
  end

  def simple_scan(pattern)
    @matched_text = []
    @pattern = Regexp.new(pattern)
    scan
    output
  end

  private

  def scan
    @matched_text = []
    File.open(@filename).each_line do |line|
      next unless @pattern =~ line

      line.scan(@pattern) do |s|
        pre = $`
        post = $'
        @matched_text << "#{pre[-@len, @len]}<<#{s}>>#{post[0, @len]}"
      end
    end
  end

  def output
    puts @matched_text
    puts "count: #{@matched_text.size}"
  end
end

if $PROGRAM_NAME == __FILE__ && ARGV.size >= 2
  pattern = ARGV[0]
  filename = ARGV[1]
  len = ARGV[2]

  novel = Novel.new(filename)
  puts novel.simple_scan(pattern)
end
