class Toread < ActiveRecord::Base
  attr_accessible :user_id, :book_id

  belongs_to :potential_reader, foreign_key: "user_id", class_name: "User"
  belongs_to :to_read_book, foreign_key: "book_id", class_name: "Book"
end
