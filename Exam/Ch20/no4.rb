# frozen_string_literal: true

require 'date'
require 'English'

# class to create calender object using month and year
# using present month if no argument is given.
class Calender
  WDAY = %w[Su Mo Tu We Th Fr Sa].freeze
  def initialize(month, year)
    @month = month
    @year = year
    create
  end

  def create(year = @year, month = @month)
    @time = Date.new(year, month)
  end

  def show
    puts month_and_year
    puts weeks
    puts dates
  end

  def str_length
    weeks.length
  end

  def month_and_year
    @time.strftime('%B %Y').center(str_length)
  end

  def weeks
    WDAY.join(' ')
  end

  def dates
    result = '   ' * @time.wday

    upto = @time.next_month.prev_day
    (@time..upto).each do |date|
      result += format('%3d', date.mday)
      result += $RS if date.saturday?
    end

    result
  end
end

if $PROGRAM_NAME == __FILE__
  today = Time.now
  month = ARGV[0] ? ARGV[0].to_i : today.month
  year = ARGV[1] ? ARGV[1].to_i : today.year
  calender = Calender.new(month, year)
  puts "#{year}年#{month}月のカレンダーを表示します："
  calender.show
end
