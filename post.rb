require 'nokogiri'
# require 'open-uri'
# require 'rubygems'
class Post

  attr_reader :title, :url, :points, :item_id, :comment_list

  def initialize(post_url)
    # doc = Nokogiri::HTML(File.open('../post.html'))
    doc = Nokogiri::HTML(File.open('post.html'))

    @title = doc.css('title').inner_text #hacker news title
    @url = post_url #url #hacker news url
    @points = doc.css('.score').inner_text.slice(/[0-9]+/,0)
    @item_id = doc.css(".score").to_s.slice(/_(\d+)"/, 1)
    @comment_list = []
    get_comments_from_post
  end

  def post
    comment_list
  end

  private

  def add_comment(comment_obj)
    @comment_list.push(comment_obj)
  end

  def get_comments_from_post

    doc = Nokogiri::HTML(File.open(url))
    # comments = doc.css('.comhead')
    comments = doc.css('.athing')
    comments.each do |comment|
      # puts comment
      text = comment.css('.c00').text.gsub(/-{5}/,"").strip#.strip#delete("\n")
      author = comment.css('.comhead').text.slice(/[a-z]+\s/)
      days_ago = comment.css('.comhead').css('.age').text.slice(/[0-9]+/)
      add_comment(Comment.new(text,author,days_ago))
    end
  end

end

