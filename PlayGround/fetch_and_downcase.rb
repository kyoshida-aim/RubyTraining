def fetch_and_downcase(ary, index)
  if str = ary[index]
    return str.downcase
  end
end

ary = %w[Boo Foo Woo]
p fetch_and_downcase(ary, 1)
