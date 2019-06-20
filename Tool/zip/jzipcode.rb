# frozen_string_literal: true

require 'sqlite3'
require 'csv'
require 'English'

# class to call SQL commands
class SQLCommands
  class << self
    def create_table
      <<-SQL
        CREATE TABLE IF NOT EXISTS zip_codes
        (code TEXT, pref TEXT, city TEXT, addr TEXT, alladdr TEXT)
      SQL
    end

    def write_line
      <<-SQL
          INSERT INTO zip_codes VALUES
            (:code, :pref, :city, :addr, :alladdr)
      SQL
    end

    def find_by_code
      <<-SQL
        SELECT code, alladdr
          FROM zip_codes
          WHERE code = ?
      SQL
    end

    def find_by_address
      <<-SQL
        SELECT code, alladdr
          FROM zip_codes
          WHERE alladdr LIKE ?
      SQL
    end
  end
end

# this class will create database of Zip and enable searching.
class JZipCode
  # index used in CSV
  CSV_COLUMN = { code: 2, pref: 6, city: 7, addr: 8 }.freeze

  def initialize(dbfile)
    @dbfile = dbfile
  end

  def create(zipfile)
    return if File.exist?(@dbfile)

    with_transaction do |db|
      db.execute(SQLCommands.create_table)

      data_to_write = csv2data(zipfile)

      data_to_write.each do |line|
        db.execute(SQLCommands.write_line, line)
      end
    end
  end

  def find_by_code(code)
    find(sql_command: SQLCommands.find_by_code, arg: code)
  end

  def find_by_address(addr)
    like = "%#{addr}%"
    find(sql_command: SQLCommands.find_by_address, arg: like)
  end

  private

  def csv2data(zipfile)
    all_data = []
    CSV.read(zipfile, 'r').each do |line|
      all_data << line_to_data(line)
    end
    all_data
  end

  def with_transaction(&block)
    SQLite3::Database.open(@dbfile) do |db|
      db.transaction do
        block.call(db)
      end
    end
  end

  def line_to_data(line_array)
    data = {}
    CSV_COLUMN.each { |key, index| data[key] = line_array[index] }
    data[:alladdr] = data[:pref] + data[:city] + data[:addr]
    data
  end

  def find(sql_command:, arg:)
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(sql_command, arg) { |row| ret << row.join(' ') + $RS }
    end
    ret
  end
end
