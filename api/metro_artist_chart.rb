require 'nokogiri'
require 'open-uri'

KEY = '79ad32cfdfc9ea8a4eb6ec254d701098'
page = ARGV[0]
doc = Nokogiri::HTML(open("http://ws.audioscrobbler.com/2.0/?method=geo.getmetroartistchart&country=poland&metro=warsaw&api_key=#{KEY}&page=#{page}"))

doc.css('lfm topartists artist').each do |artist|
  puts artist.css('name').children.text
  puts artist.css('image[@size=mega]').children.text
end
