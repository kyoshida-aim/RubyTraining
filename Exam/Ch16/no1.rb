# frozen_string_literal: true

address = 'kyoshida@aiming-inc.com'
pattern = /(.+)(?:@)(.+)/
pattern =~ address

puts "メールアドレス: #{address}"
# same as => p "$1: #{$1}, $2: #{$2}"
# rubocop required not to use $1
puts "$1: #{Regexp.last_match(1)}, $2: #{Regexp.last_match(2)}"
