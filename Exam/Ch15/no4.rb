# frozen_string_literal: true

# exam no.4
def str2hash(str)
  result = {}
  str.split(/\s+/).each_slice(2) do |a|
    a[1] ||= ''
    result[a[0]] = a[1]
  end
  result
end

p str2hash("blue 青 white 白\nred 赤 hoge")
