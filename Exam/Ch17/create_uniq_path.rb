# frozen_string_literal: true

require_relative './create_path'

def create_uniq_path
  filename = 'meaningless.file'
  filename = create_path(filename, '_') while File.exist?(filename)
  filename
end
