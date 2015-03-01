#############################
# routes/base.rb
#############################
module TimeToLeave
module Routes

  class Base < Sinatra::Base
    register Sinatra::CrossOrigin
    configure { enable :cross_origin }

    helpers Sinatra::JSON
  end

end
end
