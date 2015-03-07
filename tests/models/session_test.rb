# encoding: UTF-8
#############################
# tests/models/session_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::SessionTest < Minitest::Test
  include ModelTests

  def setup
    @required_attrs = { user_id: 123,
                        token: 'foobar',
                        token_expires_at: Time.now }

    @model = LeaveAtApi::Session.new(@required_attrs)
  end
end
