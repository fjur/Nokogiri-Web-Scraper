class Comment

  attr_reader :text, :author, :age

  def initialize(text, author, age)
    @text = text
    @author = author
    @age = age
  end

  def display_comment
    puts "Author: #{author}"
    puts "Days Old: #{age}"
    puts "Comment Text: #{text}"
    puts ""
  end
end