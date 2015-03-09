#############################
# controllers/reminders_controller.rb
#############################
module LeaveAtApi
  class RemindersController < ApplicationController
    BASE_URL = '/reminders'.freeze

    get BASE_URL + '/?' do
      if @current_user.is_admin?
        json Reminder.active_for params[:interval] || 3.hours
      else
        json @current_user.reminders
      end
    end

    get BASE_URL + '/:id/?' do
      if @current_user.is_admin?
        json Reminder.find params[:id]
      else
        json @current_user.reminders.find params[:id]
      end
    end

    # post BASE_URL + '/?' do
    #   reminder = Models::Reminder.new(parsed_json_params)

    #   if reminder.save
    #     status 201
    #     json reminder
    #   else
    #     status 400
    #     json reminder.errors.messages
    #   end
    # end

    post BASE_URL + '/:id/?' do
      if @current_user.is_admin?
        reminder = Reminder.find params[:id]
      else
        reminder = @current_user.reminders.find params[:id]
      end

      if reminder.update parsed_json_params
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
