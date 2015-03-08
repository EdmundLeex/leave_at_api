require 'factory_girl'

FactoryGirl.define do
  factory :session, class: LeaveAtApi::Session do
    token 'foobar'
    token_expires_at { Time.now + 1.year }
    user
  end
end
