#############################
# routes/root.rb
#############################
module LeaveAtAPI
module Routes

  class RootRoute < Base
    get '/' do
      'Hello World!'
    end
  end

end
end