# require 'faker'
#
# FactoryGirl.define do
#   factory :event do
#     event_type "casual"
#     event_name { Faker::Hipster.word }
#     description { Faker::Hipster.paragraph }
#     venue_name { Faker::Hipster.word }
#     address { Faker::Address.street_address }
#     city { Faker::Address.city }
#     state { Faker::Address.state }
#     zip_code { Faker::Address.zip[0..4] }
#     event_start { Faker::Time.between(DateTime.now - 1, DateTime.now) }
#     event_end { Faker::Time.between(DateTime.now - 1, DateTime.now) }
#   end
# end
