require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:author) { User.create(name: 'David') }
  let!(:post) { Post.create(author:, title: 'Dear pets', comments_counter: 0, likes_counter: 0) }
  let!(:like) { Like.create(user: author, post:) }

  context '#update_post_likes_counter' do
    it 'should increment likes_counter by one' do
      like.update_post_likes_counter
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
