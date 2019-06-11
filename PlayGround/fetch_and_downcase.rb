# frozen_string_literal: true

def fetch_and_downcase(ary, index)
  str = ary[index]
  return unless str

  str = str.downcase
  return unless str

  str
end

# ary = %w[Boo Foo Woo]
ary = 5
p fetch_and_downcase(ary, 1)
