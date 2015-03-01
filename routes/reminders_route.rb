#############################
# routes/root.rb
#############################
module TimeToLeave
module Routes

  class RemindersRoute < Base
    BASE_URL = '/reminders'.freeze

    get BASE_URL + '/?' do
      json Destination.all
    end

    get BASE_URL + '/:id/?' do
      'Your Destination'
    end

    post BASE_URL + '/?' do
      'Create'
    end

    put BASE_URL + '/:id/?' do
      'Update'
    end

    delete BASE_URL + '/:id/?' do
      'Delete'
    end
  end

end
end
