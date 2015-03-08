# encoding: UTF-8
#############################
# tests/models/session_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::SessionTest < Minitest::Test
  include ModelTests

  def setup
    @model = build :session
  end

  def teardown
    @model.destroy
  end
end
