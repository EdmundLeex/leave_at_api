#############################
# controllers/sessions_controller.rb
#############################
module LeaveAtApi
  class SessionsController < ApplicationController
    post '/authenticate/?' do
      user = LeaveAtApi::User.find_by email: parsed_json_params['email']
      handle_unauthorized unless user

      if user.authenticate parsed_json_params['password']
        { access_token: user.sessions.create.token }.to_json
      else
        handle_unauthorized
      end
    end

    delete '/revoke/?' do
      @current_user.sessions.destroy_all
      'revoked'
    end

  end
end
