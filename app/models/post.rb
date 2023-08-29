class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id

  def recent_comments
    comments.order(created_at: :desc)
  end

  after_create :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
