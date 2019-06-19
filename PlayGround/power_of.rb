# frozen_string_literal: true

def power_of(num)
  lambda do |x|
    return x**num
  end
end

cube = power_of(3)
p cube.call(5) #=> 125

# using lambda in method like above will cause LocalJumpError.

=begin # rubocop:disable Style/BlockComments
def power_of2(num)
  proc do |x|
    return x**num
  end
end

cube = power_of(3)
p cube.call(5) #=> Error
=end
# rubocop:enable Style/BlockComments
