require_relative 'spec_helper'
# require 'rspec'
# require_relative '../post'


describe Post do

  before :each do
    post_url = '../post.html'
    @post = Post.new(post_url)
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

  describe '#initilize' do

    it 'should throw an error is url is not provided' do
      expect{ Post.new('') }.to raise_error PostError
    end

    it 'should throw post Error is it cannot open document' do
      expect {Post.new('www.google.ca')}.to raise_error PostError
    end

  end



  describe '#add_comment' do

    # it 'should take in a comment object' do
    #   expect{ @post.add_comment(1) }.to raise_error PostError
    # end
    


    # it 'should add the comment to the comment list' do
    #   comment = Comment.new("","","")
    #   # expect(@post).to receive(:add_comment).with(comment)
    #   # expect(@post).to be_truthy
    #   # expect(@post.comment_list.length).to be > 0
    #   @post.add_comment(comment)
    #   expect(@post.comment_list.length).to be > 0
    # end


  end

end