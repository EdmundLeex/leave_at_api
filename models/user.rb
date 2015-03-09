# encoding: UTF-8
#############################
# models/user.rb
#############################
module LeaveAtApi
  class User < ActiveRecord::Base
    has_secure_password

    has_many :reminders
    has_many :sessions

    validates :email, presence: true
    validates :is_admin, inclusion: { in: [true, false] }

    def create_session
      token = SecureRandom.urlsafe_base64 32
      sessions.create token: token, token_expires_at: Time.now + 1.hour
    end
  end
end
