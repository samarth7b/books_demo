class Read < ActiveRecord::Base
  attr_accessible :user_id, :book_id

  belongs_to :reader, foreign_key: "user_id", class_name: "User"
  belongs_to :read_book, foreign_key: "book_id", class_name: "Book"

  validates :user_id, presence: true
  validates :book_id, presence: true
end
