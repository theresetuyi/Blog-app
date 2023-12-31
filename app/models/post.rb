class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  has_many :recent_comments, -> { order(created_at: :desc).limit(5) }, class_name: 'Comment'

  after_create :update_posts_counter

  def recent_five_comments
    comments.includes([:author]).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
