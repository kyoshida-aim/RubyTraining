# frozen_string_literal: true

def fahr_to_cels(degrees)
  (degrees - 32) * 5 / 9.0
end

if $PROGRAM_NAME == __FILE__
  (1..100).each do |degrees|
    puts format('華氏:%<fahr>.2f度　摂氏:%<cells>.2f度',
                fahr: degrees,
                cels: fahr_to_cels(degrees))
  end
end
