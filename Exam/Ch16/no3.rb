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

p word_capitalize('in-reply-to')
p word_capitalize('X-MAILER')
p word_capitalize('asdalskdjfpwqoieruklajfzknzscxmfnv')
