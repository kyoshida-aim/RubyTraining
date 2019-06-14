# frozen_string_literal: true

# exam no.4
def str2hash(str)
  keys_and_val = str.split(/\s+/)
  keys_and_val << '' if keys_and_val.size.odd?
  Hash[*keys_and_val]
end

p str2hash("blue 青 white\t白\nred 赤 hoge ") if $PROGRAM_NAME == __FILE__
