require 'rails_helper'

RSpec.describe 'User index page', type: :request do
  let!(:user_one) { User.create(name: 'Ange', posts_counter: 2) }
  let!(:user_two) { User.create(name: 'Peter', posts_counter: 5) }

  it 'displays user information' do
    get users_path
    expect(response.body).to include('Ange')
    expect(response.body).to include('Peter')
    expect(response.body).to include("#{user_one.name} profile picture")
    expect(response.body).to include("#{user_two.name} profile picture")
    expect(response.body).to include("Number of posts: #{user_one.posts_counter}")
    expect(response.body).to include("Number of posts: #{user_two.posts_counter}")
  end

  it 'redirects to user show page when clicking on user details' do
    get users_path
    within('#users') do
      click_link 'User details', href: user_path(user_one)
      follow_redirect!
      expect(response).to redirect_to(user_path(user_one))
    end
  end

  it 'has a title of "List all users"' do
    get users_path
    expect(response.body).to include('<h1>List all users</h1>')
  end
end
