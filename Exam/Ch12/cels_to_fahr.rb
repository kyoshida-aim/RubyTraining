# frozen_string_literal: true

def cels_to_fahr(degrees_cels)
  degrees_cels * 9.0 / 5 + 32
end

(1..100).each do |degrees|
  printf("摂氏:%.2f度　華氏:%.2f度\n", degrees, cels_to_fahr(degrees))
end
