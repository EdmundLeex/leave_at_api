require 'sidekiq/web'
require './app'

run Rack::URLMap.new('/api' => LeaveAtApi::App, '/sidekiq' => Sidekiq::Web)
