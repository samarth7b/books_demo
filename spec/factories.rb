FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :review do
    content "Lorem ipsum"
    user
  end

  factory :book do
    title "LOTR"
    author "JRRT"
    genre "fantasy"
    user
  end
end