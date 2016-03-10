require_relative "formatter"

class HackerNewsFormat < Formatter

  def self.get_item_id_from_html(doc)
    doc.css(".score").to_s.slice(/_(\d+)"/, 1)
  end

  def self.get_points_from_html(doc)
    doc.css('.score').inner_text.slice(/[0-9]+/,0)
  end

  def self.get_title_from_html(doc)
    doc.css('.title a').inner_text
  end

  def self.get_url_from_html(doc)
    doc.css('.sitestr').text 
  end

  def self.grab_comment_format(doc)
    doc.css('.athing')
  end

  def self.format_comment_author(comment)
    comment.css('.comhead').text.slice(/[a-z]+\s/)
  end

  def self.format_comment_text(comment)
    comment.css('.c00').text.gsub(/-{5}/,"").strip
  end

  def self.format_comment_age(comment)
    comment.css('.comhead').css('.age').text.slice(/[0-9]+\b.+/)
  end

  

end