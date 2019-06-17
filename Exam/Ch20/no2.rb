# frozen_string_literal: true

require 'time'

def jparsedate(str)
  str = str.sub(/(?:午後)(.+)(?:時)/, "#{Regexp.last_match(1).to_i + 12}時")
  str = str.sub(/(?:午前)/, '')
  Time.strptime(str, '%Y年%m月%d日%H時%M分%S秒')
end

puts jparsedate(ARGV[0]) if ($PROGRAM_NAME == __FILE__) && ARGV[0]
