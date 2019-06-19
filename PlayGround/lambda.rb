# frozen_string_literal: true

square = ->(n) { return n**2 }
p square[5] #=> 25
p square.parameters #=> [[[:req, :n]]
