#############################
# controllers/sessions_controller.rb
#############################
module LeaveAtApi
  class SessionsController < ApplicationController
    post 'authenticate/?' do
      # create session
    end

    delete 'revoke/?' do
      # delete session
    end

    post '/login/?' do
      user = LeaveAtApi::User.find_by email: parsed_json_params['email']
      handle_unauthorized unless user

      if user.authenticate parsed_json_params['password']
        response.set_cookie cookie_key, cookie_hash(user)
      else
        handle_unauthorized
      end
    end

    private

    def cookie_hash user
       { value: user.create_session.token,
         domain: request.env['SERVER_NAME'] }
    end

  end
end
