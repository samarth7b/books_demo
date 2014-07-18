class Review < ActiveRecord::Base
  attr_accessible :book_title, :content, :review_title
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  default_scope order: 'reviews.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
