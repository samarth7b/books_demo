class Book < ActiveRecord::Base
  attr_accessible :author, :genre, :title
  has_and_belongs_to_many :users

  validates :title, presence: true
end
