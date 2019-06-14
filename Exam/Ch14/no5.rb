# frozen_string_literal: true

def kan2num(str)
  result = 0
  result += get_digit_value(str, '千')
  result += get_digit_value(str, '百')
  result += get_digit_value(str, '十')
  result += kan2int(str[-1]) unless digit?(str[-1])
  result
end

def get_digit_value(str, digit)
  return 0 unless (index = str.index(digit))

  prev_char = str[index - 1]
  # if there are no number|digit in front of digit
  if index.zero? || digit?(prev_char)
    digit2int(digit)
  else
    kan2int(prev_char) * digit2int(digit)
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

puts kan2num('千二十')
