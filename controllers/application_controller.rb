#############################
# routes/base.rb
#############################
# require 'sinatra/cookies'

module LeaveAtApi
  class ApplicationController < Sinatra::Base
    register Sinatra::CrossOrigin
    register Sinatra::MultiRoute

    helpers Sinatra::JSON

    configure { enable :cross_origin }

    before do
      authenticate! unless skip_auth? request.path_info
    end

    not_found do
      status 404
      'not found'
    end

    def parsed_json_params
      request.env['rack.request.form_hash']
    end

  private

    def authenticate!
      token = request.env['HTTP_ACCESS_TOKEN']
      @current_user = LeaveAtApi::User.joins(:sessions).find_by('sessions.token = ?', token)

      handle_unauthorized unless @current_user
    end

    def skip_auth? path_info
      skips = [/^\/authenticate/]
      Regexp.union(skips).match path_info
    end

    def handle_unauthorized
      halt 403, 'unauthorized'
    end
  end
end
