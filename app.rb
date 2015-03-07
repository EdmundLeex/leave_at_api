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

module LeaveAtApi

  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension
    use ActiveRecord::ConnectionAdapters::ConnectionManagement

    set :root, File.dirname(__FILE__)

    use Rack::Deflater

    use Routes::RootRoute
    use Routes::RemindersRoute
  end

end
