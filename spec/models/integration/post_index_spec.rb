require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before do
    # Create a user and posts with comments
    @user = User.create(name: 'Test User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @posts = []
    5.times do |i|
      post = @user.posts.create(title: "Post #{i}", text: "Post text #{i}")
      post.comments.create(text: "Comment text #{i}")
      @posts << post
    end

    # Visit the user's posts path
    visit user_posts_path(@user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it "displays the user's username" do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Total posts: 5')
  end

  it "displays a post's title" do
    expect(page).to have_content('Post 0')
  end

  it "displays some of the post's body" do
    expect(page).to have_content('Post text 0')
  end


  it 'displays the number of comments on a post' do
    post = @posts.first
    expect(page).to have_content("Number of comments: #{post.comments_counter}")
  end

  it 'displays the number of likes on a post' do
    expect(page).to have_content('Number of likes: 0')
  end
end
