#############################
# routes/base.rb
#############################
module LeaveAtApi
  class ApplicationController < Sinatra::Base
    register Sinatra::CrossOrigin
    register Sinatra::MultiRoute

    configure { enable :cross_origin }
    before    { authenticate! }

    helpers Sinatra::JSON

    private

    def authenticate!
      token = request.env['HTTP_ACCESS_TOKEN']
      @current_user = LeaveAtApi::User.joins(:sessions).find_by('sessions.token = ?', token)

      halt 403, 'unauthorized' unless @current_user
    end

    def parsed_params
      posted_body = request.body.read
      posted_body.empty? ? {} : JSON.parse(posted_body)
    end
  end
end
