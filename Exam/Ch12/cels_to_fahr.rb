# frozen_string_literal: true

def cels_to_fahr(degrees_cels)
  degrees_cels * 9.0 / 5 + 32
end

if $PROGRAM_NAME == __FILE__
  (1..100).each do |degrees|
    puts format('摂氏:%<cels>.2f度　華氏:%<fahr>.2f度',
                cels: degrees,
                fahr: cels_to_fahr(degrees))
  end
end
