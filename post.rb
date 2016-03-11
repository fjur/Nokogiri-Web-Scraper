require 'nokogiri'
require_relative 'posterror'
require_relative 'Comment'
require_relative 'hackerformat'
# require 'open-uri'
# require 'rubygems'
class Post

  attr_reader :title, :url, :points, :item_id, :comment_list

  def initialize(post_url)
    raise PostError, "URL is nil, need an open-uri object" if post_url.nil?
    begin
      doc = Nokogiri::HTML(open(post_url))
    rescue
      raise PostError, "Could not open document"
    end

    @title = HackerNewsFormat.get_title_from_html(doc)
    @url = HackerNewsFormat.get_url_from_html(doc)
    @points = HackerNewsFormat.get_points_from_html(doc)
    @item_id = HackerNewsFormat.get_item_id_from_html(doc)
    @comment_list = [] #Could call get_comments_from_post and pass the doc, Will the doc be passed by value or reference? Check if you can force pass by reference
    @post_url = post_url
    get_comments_from_post
  end

  def post
    comment_list
  end

  def display_post_info #Use to_str and pass to a display class, makes it easier to unit test
    puts "Title\t: #{title}"
    puts "Url\t: #{url}"
    puts "Points\t: #{points}"
    puts "Item ID\t: #{item_id}"
    puts "# Comments : #{comment_list.length}"
  end

  def show_all_comments
    @comment_list.each {|comment| comment.display_comment}
  end

  private

  def add_comment(comment_obj)
    if comment_obj.is_a?(Comment)
      @comment_list.push(comment_obj)
    else
      raise PostError, "Must pass a comment object to add comment"
    end
  end

  def get_comments_from_post
    doc = Nokogiri::HTML(File.open(@post_url))
    comments = HackerNewsFormat.grab_comment_format(doc)
    comments.each do |comment|
      text = HackerNewsFormat.format_comment_text(comment)
      author = HackerNewsFormat.format_comment_author(comment)
      age = HackerNewsFormat.format_comment_age(comment)
      add_comment(Comment.new(text,author,age))
    end
  end

end

