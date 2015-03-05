# encoding: UTF-8
#############################
# app.rb
#############################
require 'rubygems'
require 'bundler'
require 'pp'

Bundler.require

require_all 'models', 'routes'

Dotenv.load

module LeaveAtAPI

  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    set :root, File.dirname(__FILE__)

    use Rack::Deflater

    use Routes::RootRoute
    use Routes::RemindersRoute
  end

end
