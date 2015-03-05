require 'sidekiq/web'
require './app'

run Rack::URLMap.new('/api' => LeaveAtAPI::App, '/sidekiq' => Sidekiq::Web)
