# encoding: UTF-8
#############################
# models/session.rb
#############################
module LeaveAtApi
  class Session < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true

    before_create :set_default_values

  private

    def set_default_values
      self.token ||= SecureRandom.urlsafe_base64(32)
      self.token_expires_at ||= Time.now + 1.hour
    end
  end
end
