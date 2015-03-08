require 'factory_girl'

FactoryGirl.define do
  factory :user, class: LeaveAtApi::User do
    sequence(:email) { |n| "test#{n}@example.com"}
    password '1234'
    is_admin false
  end
end