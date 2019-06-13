# frozen_string_literal: true

def prime?(num)
  return false if num <= 1

  (2...num).each do |divider|
    return false if (num % divider).zero?
  end

  true
end

if $PROGRAM_NAME == __FILE__
  num = ARGV[0].to_i
  puts format('%<num>dは素数で', num: num) + (prime?(num) ? 'ある' : 'ない')
end
