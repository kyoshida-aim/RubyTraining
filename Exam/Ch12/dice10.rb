# frozen_string_literal: true

require './dice.rb'

def dice10
  (1..10).each do |i|
    printf("%d回目:%d\n", i, dice)
  end
end

dice10 if $PROGRAM_NAME == __FILE__
