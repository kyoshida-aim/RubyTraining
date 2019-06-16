# frozen_string_literal: true

def txtfile2ary(filename)
  File.read(filename).split(/\n/)
end
