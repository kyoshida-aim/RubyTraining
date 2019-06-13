# frozen_string_literal: true

def dice
  Random.rand(1..6)
end

p dice if $PROGRAM_NAME == __FILE__
