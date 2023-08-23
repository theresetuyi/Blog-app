require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { User.create(name: 'User Name') }

  describe 'GET /index' do
    before(:each) do 
      puts user.id
      get user_posts_path(user)
    end

    it 'returns correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end
  end
  
  describe 'GET #show' do
    let!(:post) { Post.create(title: 'Post Title', user: user) }
    
    before do
      get user_post_path(user, post)
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
