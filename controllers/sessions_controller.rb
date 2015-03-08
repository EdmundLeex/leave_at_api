#############################
# controllers/sessions_controller.rb
#############################
module LeaveAtApi
  class SessionsController < ApplicationController
    BASE_URL = '/sessions'.freeze

    post BASE_URL + '/?', 'authenticate/?' do
      # create session
    end

    delete BASE_URL + '/?', 'revoke/?' do
      # delete session
    end

  end
end
