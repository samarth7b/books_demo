class Book < ActiveRecord::Base
  attr_accessible :author, :genre, :title
  #has_and_belongs_to_many :users

  has_many :reverse_reads, foreign_key: "book_id", class_name:  "Read",
                                   dependent:   :destroy
  has_many :readers, :through => :reverse_reads, source: :reader

  validates :title, presence: true
end
