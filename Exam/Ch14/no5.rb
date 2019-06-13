# frozen_string_literal: true

def kan2num(str)
  result = 0
  result += get_kan_digit(str, '千')
  result += get_kan_digit(str, '百')
  result += get_kan_digit(str, '十')
  result += kan2int(str[-1]) if str[-1] != '十'
  result
end

def get_kan_digit(str, digit)
  return 0 unless (index = str.index(digit))

  if index.zero? || digit?(str[index - 1])
    digit2int(digit)
  else
    kan2int(str[index - 1]) * digit2int(digit)
  end
end

def digit?(str)
  %w[千 百 十].include?(str)
end

def digit2int(digit)
  return 0 unless digit?(digit)

  case digit
  when '千'
    1000
  when '百'
    100
  when '十'
    10
  end
end

def kan2int(str)
  str.tr('一二三四五六七八九', '123456789').to_i
end

puts kan2num('千百二十三')
