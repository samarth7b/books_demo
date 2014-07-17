class Read < ActiveRecord::Base
  attr_accessible :user_id, :book_id

  belongs_to :reader, class_name: "User"
  belongs_to :read_book, class_name: "Book"

  validates :user_id, presence: true
  validates :book_id, presence: true
end
