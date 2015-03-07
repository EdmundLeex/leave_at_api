# encoding: UTF-8
#############################
# tests/models/user_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::UserTest < Minitest::Test
  include ModelTests

  def setup
    @required_attrs = { email: 'foo@bar.com',
                        password: '1234',
                        password_confirmation: '1234',
                        is_admin: false }

    @model = LeaveAtApi::User.new(@required_attrs)
  end
end
