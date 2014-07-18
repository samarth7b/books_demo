class Book < ActiveRecord::Base
  attr_accessible :author, :genre, :title
  #has_and_belongs_to_many :users

  has_many :reads, dependent: :destroy
  has_many :readers, :through => :reads, class_name: "User"

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
