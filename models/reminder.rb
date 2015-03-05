# encoding: UTF-8
#############################
# models/destination.rb
#############################
module LeaveAtAPI
module Models

  class Reminder < ActiveRecord::Base
    def self.active_for(interval)
      where('arrival_time <= ?', Time.now + interval).where(is_finished: false)
    end
  end

end
end
