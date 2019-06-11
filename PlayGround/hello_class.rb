# frozen_string_literal: true

# this class will return text with someones name.
class HelloWorld
  def initialize(myname = 'Ruby')
    @name = myname
  end

  def hello
    puts("Hello, world. I am #{@name}.")
  end
end

bob = HelloWorld.new('Bob')
alice = HelloWorld.new('Alice')
ruby = HelloWorld.new

bob.hello
alice.hello
ruby.hello
