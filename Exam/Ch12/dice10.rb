# frozen_string_literal: true

require './dice.rb'

def dice10
  total = 0
  10.times { total += dice }
  total
end

puts format('出目の合計:%<total>d', total: dice10) if $PROGRAM_NAME == __FILE__
