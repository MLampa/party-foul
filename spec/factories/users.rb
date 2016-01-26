require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "SayWhaaaaatttt#{n}" }
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    password { Faker::Internet.password }
  end

  factory :review do
    rating 5
    review_body { Faker::Hipster.paragraph }
    venue
    user
  end
end
