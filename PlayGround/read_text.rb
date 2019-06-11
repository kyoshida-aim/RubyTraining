# frozen_string_literal: true

filename = ARGV[0]
file = File.open(filename)
text = file.read
print text
file.close
