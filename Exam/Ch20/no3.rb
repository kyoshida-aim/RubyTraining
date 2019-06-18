# frozen_string_literal: true

# this class reproduces Unix Command
class UnixIsh
  def ls_t(path)
    return unless File.directory?(path)

    puts '最終更新日 : ファイル名'
    ls_list = LsList.new(path)
    ls_list.sorted_by_ctime.each do |ctime, name|
      puts ls_t_format(ctime, name)
    end
  end

  def ls_t_format(ctime, name)
    "#{ctime} : #{name}"
  end
end

# class to create list object using at class::UnixIsh
class LsList
  def initialize(path)
    @path = path
    @list = list
  end

  def sorted_by_ctime
    # item[0] is updated time of file
    @list.sort_by { |item| item[0] }
  end

  private

  def list
    list = []
    Dir.open(@path) do |dir|
      dir.each do |name|
        next if name == '.'
        next if name == '..'

        list << [File.stat(@path + '/' + name).ctime, @path + '/' + name]
      end
    end
    list
  end

end

UnixIsh.new.ls_t(ARGV[0]) if ($PROGRAM_NAME == __FILE__) && ARGV[0]
