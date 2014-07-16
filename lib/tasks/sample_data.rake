#namespace :db do
#  desc "Fill database with sample data"
#  task populate: :environment do
#    admin = User.create!(name: "Example User",
#                         email: "example@railstutorial.org",
#                         password: "foobar",
#                         password_confirmation: "foobar")
#    admin.toggle!(:admin)
#    99.times do |n|
#      name  = Faker::Name.name
#      email = "example-#{n+1}@railstutorial.org"
#      password  = "password"
#      User.create!(name: name,
#                   email: email,
#                   password: password,
#                   password_confirmation: password)
#
#     users = User.all(limit: 6)
#      10.times do
#        book_title = Faker::Lorem.sentence(1, 1)
#        review_title = Faker::Lorem.sentence(4)
#        content = Faker::Lorem.paragraph(3)
#        users.each { |user| user.reviews.create!(book_title: book_title, review_title: review_title, content: content) }
#      end
#    end
#  end
#end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_reviews
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_reviews
  users = User.all(limit: 6)
  10.times do
    book_title = Faker::Lorem.sentence(1, 1)
    review_title = Faker::Lorem.sentence(4)
    content = Faker::Lorem.paragraph(3)
    users.each { |user| user.reviews.create!(book_title: book_title, review_title: review_title, content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end