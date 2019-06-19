# frozen_string_literal: true

# this class will contain novel text for word counting
class Novel
  def initialize(filename)
    raise Errno::ENOENT unless File.exist?(filename)

    @filename = filename
  end

  def simple_scan(pattern)
    return unless File.exist?(@filename)

    @matched_text = []
    @pattern = Regexp.new(pattern)
    @len = 5
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

if $PROGRAM_NAME == __FILE__ && ARGV.size == 2
  pattern = ARGV[0]
  filename = ARGV[1]

  novel = Novel.new(filename)
  puts novel.simple_scan(pattern)
end
