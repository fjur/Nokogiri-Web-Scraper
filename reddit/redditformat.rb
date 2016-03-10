require_relative "../formatter"

class RedditFormat < Formatter

  def self.get_title_from_html(doc)
    doc.css('title').text
  end

  def self.get_item_id_from_html(doc)
    # doc.css(".score").to_s.slice(/_(\d+)"/, 1)
    0 # No id for this
  end

  def self.get_points_from_html(doc)
    # doc.css('.score').inner_text.slice(/[0-9]+/,0)
    0 #no points
  end

  def self.get_url_from_html(doc)
    # doc.css('.sitestr').text 
    doc.css('link').first.to_s.slice(/href="(.+)"/, 1)
  end

  def self.grab_comment_format(doc)
    # doc.css('.athing')
  end

  def self.format_comment_author(comment)
    # comment.css('.comhead').text.slice(/[a-z]+\s/)
  end

  def self.format_comment_text(comment)
    doc.css('a.title').text
    # comment.css('.c00').text.gsub(/-{5}/,"").strip
  end

  def self.format_comment_age(comment)
    # comment.css('.comhead').css('.age').text.slice(/[0-9]+\b.+/)
  end

  

end