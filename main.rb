require 'nokogiri'

doc = Nokogiri::HTML(File.open('post.html'))

puts doc
