class Comment

  attr_reader :text, :author, :days_ago

  def initialize(text, author, days_ago)
    @text = text
    @author = author
    @days_ago = days_ago
  end

  def display_comment
    puts author
    puts days_ago
    puts text
  end
end