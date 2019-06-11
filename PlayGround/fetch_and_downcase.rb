# frozen_string_literal: true

def fetch_and_downcase(ary, index)
  str = ary[index]
  return unless str

  str.downcase
end

ary = %w[Boo Foo Woo]
p fetch_and_downcase(ary, 1)
