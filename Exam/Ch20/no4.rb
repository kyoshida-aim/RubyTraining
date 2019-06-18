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
    @time = Date.new(year, month)
  end

  def show
    puts month_and_year
    puts weekday_name
    puts dates
  end

  def row_str_length
    weekday_name.length
  end

  def month_and_year
    @time.strftime('%B %Y').center(row_str_length)
  end

  def weekday_name
    WDAY.join(' ')
  end

  def dates
    dates = '   ' * @time.wday

    upto = @time.next_month.prev_day
    (@time..upto).each do |date|
      dates += format('%3d', date.mday)
      dates += $RS if date.saturday?
    end

    dates
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
