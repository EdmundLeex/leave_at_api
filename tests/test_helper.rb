# encoding: UTF-8
#############################
# tests/test_helper.rb
#############################
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'vcr'

require_relative '../app.rb'

include Rack::Test::Methods

def app; LeaveAtApi::App.new; end
