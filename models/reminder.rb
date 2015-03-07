# encoding: UTF-8
#############################
# models/reminder.rb
#############################
module LeaveAtApi
  class Reminder < ActiveRecord::Base
    belongs_to :user

    validates :origin, :destination, :arrival_time, :user_id, presence: true
    validates :is_finished, inclusion: { in: [true, false] }

    def self.active_for interval
      where('arrival_time <= ?', Time.now + interval).where(is_finished: false)
    end
  end
end
