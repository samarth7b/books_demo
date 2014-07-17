class Book < ActiveRecord::Base
  attr_accessible :author, :genre, :title
  #has_and_belongs_to_many :users

  has_many :reads
  has_many :users, :through => :reads

  validates :title, presence: true
end
