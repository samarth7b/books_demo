class Review < ActiveRecord::Base
  attr_accessible :book_title, :content, :review_title
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  default_scope order: 'reviews.created_at DESC'
end
