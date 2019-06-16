# frozen_string_literal: true

require_relative './create_path'

def create_uniq_path
  filename = 'meaningless.file'
  while File.exist?(filename)
    filename = create_path(filename, '_')
  end
  filename
end