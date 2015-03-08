# encoding: UTF-8
#############################
# tests/test_helper.rb
#############################
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'require_all'

require_relative '../app.rb'
require_all 'tests/modules', 'tests/factories'

include Rack::Test::Methods
include FactoryGirl::Syntax::Methods

def app; LeaveAtApi::App.new; end

