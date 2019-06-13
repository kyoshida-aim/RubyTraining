# frozen_string_literal: true

def prime?(num)
  return false if num <= 1
  return false if (num % 2).zero?

  last_index = Math.sqrt(num).to_i
  3.step(last_index, 2) do |divider|
    return false if (num % divider).zero?
  end

  true
end

if $PROGRAM_NAME == __FILE__
  num = ARGV[0].to_i
  puts format('%<num>dは素数で', num: num) + (prime?(num) ? 'ある' : 'ない')
end
