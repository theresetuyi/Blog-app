require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'after_create callback' do
    let!(:author) { User.create(name: 'teddy') }
    let!(:post) { Post.create(author:, title: 'Good Dad', comments_counter: 0, likes_counter: 0) }
    let!(:comment) do
      Comment.create(user: author, post:, text: 'Take care')
    end

    it 'should update post comments_counter after creating a comment' do
      comment.update_post_comments_counter
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
