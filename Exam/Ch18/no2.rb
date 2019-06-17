# frozen_string_literal: true

def du(path)
  return unless File.directory?(path)

  process(path)
end

def process(path, indent = 0)
  if File.directory?(path)
    process_dir(path, indent)
  else
    process_file(path, indent)
  end
end

def process_dir(path, indent)
  output_fileinfo(path + '/', indent)
  puts ''
  Dir.open(path) do |dir|
    dir.sort.each do |name|
      next if name == '.'
      next if name == '..'

      process(path + '/' + name, indent + 1)
    end
  end
end

def process_file(filename, indent)
  output_fileinfo(filename, indent)
  puts number_to_human_size(get_size(filename))
end

def output_fileinfo(path, indent)
  filename = File.basename(path)
  filename += '/' if File.directory?(path)
  print '  ' * indent + filename + ' '
end

def get_size(path)
  File.stat(path).size
end

def number_to_human_size(bytes)
  return "#{bytes} #{get_si(0)}" if bytes / 1024.0 < 0.5

  si_id = 0
  while bytes / 1024.0 > 0.5
    si_id += 1
    bytes /= 1024.0
  end
  format('%<bytes>.2f %<si>s', bytes: bytes, si: get_si(si_id))
end

def get_si(id)
  %w[bytes KB MB GB][id]
end

if $PROGRAM_NAME == __FILE__
  ARGV[0] ? du(ARGV[0]) : du('.')
end
