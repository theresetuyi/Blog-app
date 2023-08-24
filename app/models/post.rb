class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id

  after_create :update_posts_counter

  def recent_five_comments
    comments.includes([:user]).order(created_at: :desc).limit(5)
  end

  def recent_comments
    comments.order(created_at: :desc)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
