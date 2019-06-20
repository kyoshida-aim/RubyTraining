# frozen_string_literal: true

require 'open-uri'
require 'cgi/util'

# this class is made to handle novel 'nisendouka' from aozora.gr.jp
class NisenDownloader
  URL = 'https://www.aozora.gr.jp/cards/001779/files/56647_58167.html'
  HTML_FILE = 'nisendouka.html'
  TEXT_FILE = 'nisendouka.txt'

  def download_html
    File.open(HTMLFILE, 'wb') do |f|
      text = OpenURI.open_uri(URL, 'r:shift_jis').read
      # f.write(text) # use this in Shift_JIS env
      f.write(text.encode('utf-8')) # use this in UTF-8 env
    end
    html2txt
  end

  private

  def html2txt
    File.open(TEXTFILE, 'w') do |f|
      in_header = true
      File.open(HTMLFILE).each_line do |line|
        next if in_header && !start_of_main_text(line)

        in_header = false
        break if end_of_main_text(line)

        f.write(delete_html_tag(line))
      end
    end
  end

  def delete_html_tag(line)
    CGI.unescapeHTML(line.gsub(/<[^>]+>/, ''))
  end

  def start_of_main_text(line)
    /<div class="main_text">/ =~ line
  end

  def end_of_main_text(line)
    /<div class='bibliographical_information'>/ =~ line
  end
end

if $PROGRAM_NAME == __FILE__
  nisen = NisenDownloader.new
  nisen.download_html
end
