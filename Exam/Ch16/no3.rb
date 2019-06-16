# frozen_string_literal: true

def word_capitalize(word)
  phrase = '(\w+)'
  hyphen = '(?:-)'
  pattern_a = Regexp.new(phrase + hyphen)
  pattern_b = Regexp.new(hyphen + phrase + '\z')
  result = word.gsub(pattern_a) { $&.capitalize }
  result = result.sub(pattern_b) { $&[0] + Regexp.last_match(1).capitalize }
  result
end

word = 'in-reply-to'
puts %(元の文字列:"#{word}": \n整形後:"#{word_capitalize(word)}")
puts ''
word = 'X-MAILER'
puts %(元の文字列:"#{word}": \n整形後:"#{word_capitalize(word)}")
puts ''
word = 'asdalskdjfpwqoieruklajfzknzscxmfnv'
puts %(元の文字列:"#{word}": \n整形後:"#{word_capitalize(word)}")
