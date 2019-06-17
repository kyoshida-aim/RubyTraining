# frozen_string_literal: true

def create_file(old_name, suffix)
  extname = File.extname(old_name)
  basename = File.basename(old_name, extname)
  basename + suffix + extname
end
