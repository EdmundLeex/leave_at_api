#############################
# routes/root.rb
#############################
module LeaveAtApi
module Routes

  class RemindersRoute < Base
    BASE_URL = '/reminders'.freeze

    get BASE_URL + '/?' do
      json Models::Reminder.active_for(params[:interval] || 3.hours)
    end

    get BASE_URL + '/:id/?' do
      json Models::Reminder.find(params[:id])
    end

    # post BASE_URL + '/?' do
    #   reminder = Models::Reminder.new(parsed_params)

    #   if reminder.save
    #     status 201
    #     json reminder
    #   else
    #     status 400
    #     json reminder.errors.messages
    #   end
    # end

    post BASE_URL + '/:id/?' do
      reminder = Models::Reminder.find(params[:id])

      if reminder.update(parsed_params)
        status 200
        json reminder
      else
        status 400
        json reminder.errors.messages
      end
    end

    # delete BASE_URL + '/:id/?' do
    #   reminder = Models::Reminder.find(params[:id])
    #   reminder.destroy

    #   status 200
    #   'deleted'
    # end
  end

end
end
