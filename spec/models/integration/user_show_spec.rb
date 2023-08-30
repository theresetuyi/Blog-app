require 'rails_helper'

RSpec.feature 'User show page' do
  let!(:user) { create(:user, name: 'Ange', posts_counter: 3, bio: 'Lorem ipsum', photo: 'user.jpg') }
  let!(:posts) { create_list(:post, user.posts_counter) }

  scenario 'displays user information' do
    visit user_path(user)

    expect(page).to have_content('Ange')
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
    expect(page).to have_content('Lorem ipsum')
    expect(page).to have_css("img[src*='user.jpg']")
  end

  scenario 'displays the first 3 posts' do
    visit user_path(user)

    posts[0..2].each do |post|
      expect(page).to have_content(post.title)
    end
  end

  scenario 'does not display the "See all posts" button if there are no posts' do
    visit user_path(user)

    if user.posts_counter == 0
      expect(page).to have_no_css('button.see_all_post')
    else
      expect(page).to have_link('See all posts')
    end
  end

  scenario "clicking on a user's post redirects to the post's show page" do
    visit user_path(user)

    posts.each do |post|
      click_link(post.title)
      expect(current_path).to eq(post_path(post))
    end
  end
end
