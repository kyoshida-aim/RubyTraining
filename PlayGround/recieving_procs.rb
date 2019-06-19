# frozen_string_literal: true

=begin # rubocop: disable Style/BlockComments
  http://rubylearning.com/satishtalim/ruby_procs.html
  You cannot pass methods into other methods
  (but you can pass procs into methods),
  and methods cannot return other methods
  (but they can return procs)
=end # rubocop: enable Style/BlockComments

def some_mtd(some_proc)
  puts 'Start of mtd'
  some_proc.call
  puts 'End of mtd'
end

say = lambda do
  puts 'Hello'
end

some_mtd say
