# encoding: UTF-8
#############################
# models/user.rb
#############################
module LeaveAtApi
  class User < ActiveRecord::Base
    has_many :reminders
    has_many :sessions

    validates :email, :password, :password_confirmation, presence: true
    validates :is_admin, inclusion: { in: [true, false] }
  end
end
