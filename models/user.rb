# encoding: UTF-8
#############################
# models/user.rb
#############################
module LeaveAtApi
  class User < ActiveRecord::Base
    has_secure_password

    attr_accessor :password_digest

    has_many :reminders
    has_many :sessions

    validates :email, presence: true
    validates :is_admin, inclusion: { in: [true, false] }
  end
end
