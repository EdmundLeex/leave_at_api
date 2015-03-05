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

def app; LeaveAtAPI::App.new; end

VCR.configure do |config|
  config.cassette_library_dir = "tests/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end
