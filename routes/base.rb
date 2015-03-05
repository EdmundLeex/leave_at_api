#############################
# routes/base.rb
#############################
module LeaveAtAPI
module Routes

  class Base < Sinatra::Base
    register Sinatra::CrossOrigin
    configure { enable :cross_origin }

    helpers Sinatra::JSON

    private

    def parsed_params
      posted_body = request.body.read
      posted_body.empty? ? {} : JSON.parse(posted_body)
    end
  end

end
end
