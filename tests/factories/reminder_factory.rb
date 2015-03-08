require 'factory_girl'

FactoryGirl.define do
  factory :reminder, class: LeaveAtApi::Reminder do
    origin 'foo'
    destination 'bar'
    arrival_time Time.now
    is_finished false
    user
  end
end
