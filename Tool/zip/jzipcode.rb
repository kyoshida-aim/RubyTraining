# frozen_string_literal: true

require 'sqlite3'
require 'csv'

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
  CSV_COLUMN = { code: 2, pref: 6, city: 7, addr: 8 }.freeze

  def initialize(dbfile)
    @dbfile = dbfile
  end

  def create(zipfile)
    return if File.exist?(@dbfile)

    SQLite3::Database.open(@dbfile) do |db|
      db.execute(SQLCommands.create_table)

      db.execute('BEGIN TRANSACTION')
      CSV.open(zipfile, 'r') do |csv|
        csv.each do |rec|
          data = {}
          CSV_COLUMN.each { |key, index| data[key] = rec[index] }
          data[:alladdr] = data[:pref] + data[:city] + data[:addr]
          db.execute(SQLCommands.write_line, data)
        end
      end
      db.execute('COMMIT TRANSACTION')
    end
    true
  end

  def find_by_code(code)
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(SQLCommands.find_by_code, code) { |row| ret << row.join(' ') }
    end
    ret.map { |line| line + '\n' }.join
  end

  def find_by_address(addr)
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      like = "%#{addr}%"
      db.execute(SQLCommands.find_by_address, like) { |row| ret << row.join(' ') }
    end
    ret.map { |line| line + '\n' }.join
  end
end
