# frozen_string_literal: true

# this class reproduces Unix Command
class UnixIsh
  class << self
    def ls_t(path)
      return unless File.directory?(path)

      result = ['最終更新日 : ファイル名']
      Dir.open(path) do |dir|
        files_with_ctime(dir) { |name| result << ls_t_format(path, name) }
      end
      puts result
    end

    def files_with_ctime(dir)
      dir.sort.each do |name|
        next if name == '.'
        next if name == '..'

        yield(name)
      end
    end

    def ls_t_format(path, name)
      "#{File.stat(path + '/' + name).ctime} : #{name}"
    end
  end
end

UnixIsh.ls_t(ARGV[0]) if ($PROGRAM_NAME == __FILE__) && ARGV[0]
