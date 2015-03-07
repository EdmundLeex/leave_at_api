# encoding: UTF-8
#############################
# models/destination.rb
#############################
module LeaveAtApi
module Models

  class Reminder < ActiveRecord::Base
    def self.active_for(interval)
      where('arrival_time <= ?', Time.now + interval).where(is_finished: false)
    end
  end

end
end
