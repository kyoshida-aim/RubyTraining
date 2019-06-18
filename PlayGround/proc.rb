# frozen_string_litreal: true

hello1 = Proc.new do |name| # rubocop:disable Style/Proc
  puts "Hello, #{name}"
end

hello2 = proc do |name| # rubocop:enable Style/Proc
  puts "Hello, #{name}"
end

hello1.call('World') #=> Hello, World.
hello2.call('Ruby') #=> Hello, Ruby.
