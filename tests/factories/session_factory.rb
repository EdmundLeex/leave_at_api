require 'factory_girl'

FactoryGirl.define do
  factory :session, class: LeaveAtApi::Session do
    user
  end
end
