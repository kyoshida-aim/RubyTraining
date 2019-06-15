# frozen_string_literal: true

address = 'rubytraining@example.com'
pattern = /(.+)(?:@)(.+)/
pattern =~ address

puts "メールアドレス: #{address}"
puts "$1: #{$1}, $2: #{$2}" # rubocop:disable Style/PerlBackrefs
