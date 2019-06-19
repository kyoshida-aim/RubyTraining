# frozen_string_literal: true

fizz = proc { |n| (n % 3).zero? }
buzz = proc { |n| (n % 5).zero? }
fizzbuzz = proc { |n| fizz[n] && buzz[n] }

(1..100).each do |i|
  case i
  when fizzbuzz then puts 'FizzBuzz'
  when fizz then puts 'Fizz'
  when buzz then puts 'Buzz'
  else puts i
  end
end
