# encoding: UTF-8
#############################
# models/session.rb
#############################
module LeaveAtApi
  class Session < ActiveRecord::Base
    validates :user_id, :token, :token_expires_at, presence: true
  end
end
