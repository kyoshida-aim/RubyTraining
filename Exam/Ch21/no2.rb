# frozen_string_literal: true

to_class = :class.to_proc
p to_class.call("test")   #=> ?
p to_class.call(123)      #=> ?
p to_class.call(2 ** 100) #=> ?
p to_class.call(Time.now) #=> ?
