require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://ws.audioscrobbler.com/2.0/?method=tag.getTopTags&api_key=b25b959554ed76058ac220b7b2e0a026'))

doc.css('tag name').each do |tag|
  puts tag.content
end
