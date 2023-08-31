require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let(:post_title) { 'Test Post Title' }
  let(:post_body) { 'This is the post body text.' }

  before do
    @user = User.create(name: 'John Doe')
    @post = Post.create(title: post_title, text: post_body, author: @user)
  end

  it "displays the post's title" do
    visit post_path(@post)
    expect(page).to have_content(post_title)
  end

  it 'displays the number of comments' do
    @post.update(comments_counter: 1)
    visit post_path(@post)
    expect(page).to have_content('Comments: 1')
  end

  it 'displays the number of likes' do
    # Assuming you have likes_counter set up properly
    @post.update(likes_counter: 0)
    visit post_path(@post)
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the post body' do
    visit post_path(@post)
    expect(page).to have_content(post_body)
  end

  it 'displays the username of each commentator' do
    Comment.create(author: @user, post: @post, text: 'This is a comment.') # Use author: @user
    visit post_path(@post)
    expect(page).to have_content('Comment author: John Doe')
  end

  it 'displays the comment each commentator left' do
    comment_text = 'This is a comment.'
    Comment.create(author: @user, post: @post, text: comment_text)
    visit post_path(@post)
    expect(page).to have_content('Comment author: John Doe')
    expect(page).to have_content("Comment content: #{comment_text}")
  end
end
