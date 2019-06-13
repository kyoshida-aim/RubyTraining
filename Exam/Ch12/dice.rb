# frozen_string_literal: true

def dice
  Random.rand(1..6)
end

puts format('出目:%<result>d', result: dice) if $PROGRAM_NAME == __FILE__
