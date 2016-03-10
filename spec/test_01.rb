require_relative 'spec_helper'
# require 'rspec'
# require_relative '../post'


describe Post do

  before :each do
    # @post_url = 
    @post = Post.new('../post.html')
  end

  it "should not be nil when created" do
    expect(@post).to be_truthy
  end

  it 'should have a title' do
    expect(@post.title).to be_truthy
  end

  it 'should have a url' do
    expect(@post.url).to be_truthy
  end

  it 'should have an item_id' do
    expect(@post.item_id).to be_truthy
  end

  describe '#post' do

    it 'returns all the comments with in a post' do
      expect(@post.post).to be_a Array
    end

  end

  describe '#add_comment' do

    it 'should take in a comment object' 
    

    it 'should add the comment to the comment list' do
      comment = Comment.new("","","")
      # expect(@post).to receive(:add_comment).with(comment)
      # expect(@post).to be_truthy
      # expect(@post.comment_list.length).to be > 0
      @post.add_comment(comment)
      expect(@post.comment_list.length).to be > 0
    end


  end

end