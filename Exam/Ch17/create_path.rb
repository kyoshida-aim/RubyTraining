# frozen_string_literal: true

def create_path(old_filename, additional_text)
  extname = File.extname(old_filename)
  basename = File.basename(old_filename).sub(extname, '')
  basename + additional_text + extname
end
