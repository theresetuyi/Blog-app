require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  before do
    login_as(user)
    visit post_path(post)
  end

  it 'displays post details' do
    expect(page).to have_content("Post id: #{post.id}")
    expect(page).to have_content("Post title: #{post.title}")
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content(post.text)
  end

  it 'displays post comments' do
    post.comments.create(text: 'Comment 1')
    post.comments.create(text: 'Comment 2')

    visit post_path(post)

    expect(page).to have_content('Comment content: Comment 1')
    expect(page).to have_content('Comment content: Comment 2')
  end

  it 'displays "This post has no comments" if there are no comments' do
    visit post_path(create(:post))

    expect(page).to have_content('This post has no comments')
  end

  it 'displays a "Like this post" button' do
    expect(page).to have_button('Like this post')
  end

  it 'displays a link to create a new comment' do
    expect(page).to have_link('Create new comment', href: "/comment/new/#{post.id}")
  end

  it 'redirects to the post show page when a comment is deleted' do
    comment = post.comments.create(text: 'Comment to delete')
    visit post_path(post)

    expect(page).to have_content('Comment content: Comment to delete')
    expect(page).to have_button('Delete comment')

    click_button 'Delete comment'
    expect(page).not_to have_content('Comment content: Comment to delete')
    expect(current_path).to eq(post_path(post))
  end
end
