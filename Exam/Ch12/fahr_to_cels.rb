# frozen_string_literal: true

def fahr_to_cels(degrees)
  (degrees - 32) * 5 / 9.0
end

(1..100).each do |degrees|
  printf("華氏:%.2f度　摂氏:%.2f度\n", degrees, fahr_to_cels(degrees))
end
