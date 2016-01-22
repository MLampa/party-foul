require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "SayWhaaaaatttt#{n}" }
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    password { Faker::Internet.password }
  end

  factory :venue do
    venue_name { Faker::Hipster.word }
    description { Faker::Hipster.paragraph }
    street_name { Faker::Address.street_address }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip[0..4] }
    city { Faker::Address.city }
  end

  factory :review do
    rating 5
    review_body { Faker::Hipster.paragraph }
    venue
    user
  end
end
