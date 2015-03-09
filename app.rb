# encoding: UTF-8
#############################
# app.rb
#############################
require 'rubygems'
require 'bundler'
require 'pp'

Bundler.require

require_all 'models', 'controllers'

Dotenv.load

module LeaveAtApi
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    use ActiveRecord::ConnectionAdapters::ConnectionManagement

    use Rack::Deflater # gzip

    use RemindersController
    use SessionsController

    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
    end if ENV['RACK_ENV'] == 'production'
  end
end
