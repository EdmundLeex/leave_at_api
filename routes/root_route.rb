#############################
# routes/root.rb
#############################
module LeaveAtApi
module Routes

  class RootRoute < Base
    get '/' do
      'Hello World!'
    end
  end

end
end