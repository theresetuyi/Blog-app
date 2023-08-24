require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'returns correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe 'User', type: :request do
    context 'when the user exists' do
      let(:user) { User.create(name: 'theddy') }

      before(:each) do
        get user_path(user)
      end

      it 'returns correct response' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders correct template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
