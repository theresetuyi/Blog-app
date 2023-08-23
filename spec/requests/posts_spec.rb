require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /index' do
    let!(:user) { User.create(name: 'User Name') } # Create a user directly
    let!(:post) { Post.create } # Create a post directly

    before(:each) do
      get :index, params: { user_id: user.id }
    end

    it 'returns correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'body does not include placeholder text' do
      expect(response.body).to_not include('Here is a list of posts for a given user')
    end
  end
end
