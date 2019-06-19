# frozen_string_literal: true

require 'open-uri'
require 'cgi/util'

# this class is made to handle novel 'nisendouka' from aozora.gr.jp
class GetNisen
  URL = 'https://www.aozora.gr.jp/cards/001779/files/56647_58167.html'
  HTMLFILE = 'nisendouka.html'
  TEXTFILE = 'nisendouka.txt'
  PLAINTEXTFILE = 'nisendouka_plain.txt'

  def create_plain_text_file
    download_html
    html2txt
    delete_html_tag
  end

  private

  def download_html
    File.open(HTMLFILE, 'wb') do |f|
      text = OpenURI.open_uri(URL, 'r:shift_jis').read
      # f.write(text) # use this in Shift_JIS env
      f.write(text.encode('utf-8')) # use this in UTF-8 env
    end
    @html = File.read(HTMLFILE)
  end

  def html2txt
    File.open(TEXTFILE, 'w') do |f|
      in_header = true
      @html.each_line do |line|
        next if in_header && !start_of_main_text(line)

        in_header = false
        break if end_of_main_text(line)

        f.write line
      end
    end
  end

  def delete_html_tag
    File.open(PLAINTEXTFILE, 'w') do |f|
      File.open(TEXTFILE).each_line do |line|
        f.write(CGI.unescapeHTML(line.gsub(/<[^>]+>/, '')))
      end
    end
  end

  def start_of_main_text(line)
    /<div class="main_text">/ =~ line
  end

  def end_of_main_text(line)
    /<div class='bibliographical_information'>/ =~ line
  end
end

if $PROGRAM_NAME == __FILE__
  nisen = GetNisen.new
  nisen.create_plain_text_file
end
