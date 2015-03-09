#############################
# routes/base.rb
#############################
# require 'sinatra/cookies'

module LeaveAtApi
  class ApplicationController < Sinatra::Base
    register Sinatra::CrossOrigin
    register Sinatra::MultiRoute

    helpers Sinatra::JSON
    helpers Sinatra::Cookies

    configure { enable :cross_origin }

    before do
      authenticate! unless skip_auth? request.path_info
    end

    def parsed_json_params
      request.env['rack.request.form_hash']
    end

  private

    def authenticate!
      token = request.env['HTTP_ACCESS_TOKEN'] || cookies[cookie_key]
      @current_user = LeaveAtApi::User.joins(:sessions).find_by('sessions.token = ?', token)

      handle_unauthorized unless @current_user
    end

    def cookie_key
      '_leave_at_api_session'
    end

    def skip_auth? path_info
      skips = [/^\/login/]
      Regexp.union(skips).match path_info
    end

    def handle_unauthorized
      halt 403, 'unauthorized'
    end
  end
end
