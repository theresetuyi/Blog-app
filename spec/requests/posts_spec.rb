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

#   RSpec.describe PostsController, type: :controller do
#     let!(:user) { User.create(name: 'User Name') }
  
#     describe 'GET /show' do
#       before(:each) do
#         get :show, id: post.id
#       end
  
#       it 'returns correct response' do
#         expect(response).to have_http_status(:ok)
#       end
  
#       it 'renders correct template' do
#         expect(response).to render_template(:show)
#       end
  
#       it 'assigns the requested post to @post' do
#         expect(assigns(:post)).to eq(post)
#       end
#     end
#   end
# end

# require 'rails_helper'


# RSpec.describe PostsController, type: :controller do
#   let!(:user) { User.create(name: 'User Name') }

#   describe 'GET /show' do
#     before(:each) do
#       get :show
#     end

#     it 'returns correct response' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders correct template' do
#       expect(response).to render_template(:show)
#     end

#     it 'assigns the requested post to @post' do
#       expect(assigns(:post)).to eq(post)
#     end
#   end
# end
# require 'rails_helper'

# RSpec.describe 'Controllers', type: :request do
#   describe PostsController do
#     let(:user) { User.create(name: 'Martin') }
#     let(:post) { Post.create(author: user, title: 'Test Post') }

#     describe 'GET #index' do
#       before do
#         get user_posts_path(user)
#       end

#       it 'renders a successful response' do
#         expect(response).to be_successful
#       end

#       it 'renders the index template' do
#         expect(response).to render_template(:index)
#       end

#       it 'response body includes the right placeholders' do
#         expect(response.body).to include('Here is a list of posts for a given user')
#       end
#     end

  #   describe 'GET #show' do
  #     before do
  #       get user_post_path(user, post)
  #     end

  #     it 'renders a successful response' do
  #       expect(response).to have_http_status(:success)
  #     end

  #     it 'renders the show template' do
  #       expect(response).to render_template(:show)
  #     end
  #   end
  # end


#   #     it 'response body includes the right placeholders' do
#   #       expect(response.body).to include('Here is a given of posts for a given user')
# #   #     end
#     end
#   end
# end
# end