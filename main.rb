#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require_relative 'post'
require_relative 'reddit/redditpost'
require_relative 'comment'


# doc = Nokogiri::HTML(File.open(html_file.read))
# doc = Nokogiri::HTML(open(html_file))
# puts html_file.read

# input_html = ARGV[0]
# html_file = open(input_html)

# first_post = Post.new(html_file)
# first_post.display_post_info


reddit_url = 'reddit/post.html'

reddit_post = RedditPost.new(reddit_url)


