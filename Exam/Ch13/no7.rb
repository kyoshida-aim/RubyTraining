# frozen_string_literal: true

# exam no.7

def sum_array(nums1, nums2)
  zip_array = []
  nums1.zip(nums2) { |a, b| zip_array << a + b }
  zip_array
end

puts '問7.[1, 2, 3]と[4, 6, 8]のここの要素を足し合わせた配列'
p sum_array([1, 2, 3], [4, 6, 8])
