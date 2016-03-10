require 'nokogiri'
require_relative 'post'
require_relative 'comment'


doc = Nokogiri::HTML(File.open('post.html'))

first_post = Post.new('post.html')


# first_post.get_comments
# puts first_post.post[2].days_ago
# first_post.post.each {|x| x.display_comment}

# comments = doc.css('.comhead').text#.slice(/[0-9]+/)#.text.strip.delete("/n")