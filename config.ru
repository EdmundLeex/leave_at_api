require './app'

run Rack::URLMap.new('/api' => LeaveAtAPI::App)
