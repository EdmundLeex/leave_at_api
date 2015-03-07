#############################
# controllers/sessions_controller.rb
#############################
module LeaveAtApi
  class SessionsController < ApplicationController
    BASE_URL = '/sessions'.freeze

    post BASE_URL + '/?' do
      # create session
    end

    delete BASE_URL + '/?' do
      # delete session
    end

  end
end
