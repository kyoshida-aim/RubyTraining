# frozen_string_literal: true

pattern = /(.+)(?:@)(.+)/
pattern =~ 'kyoshida@aiming-inc.com'

# same as => p "$1: #{$1}, $2: #{$2}"
# rubocop required not to use $1
p "$1: #{Regexp.last_match(1)}, $2: #{Regexp.last_match(2)}"
