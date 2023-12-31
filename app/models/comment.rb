class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  validates :text, presence: true
  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
