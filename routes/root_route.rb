#############################
# routes/root.rb
#############################
module TimeToLeave
module Routes

  class RootRoute < Base
    get '/' do
      'Hello World!'
    end
  end

end
end