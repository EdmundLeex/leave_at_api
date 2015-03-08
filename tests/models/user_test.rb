# encoding: UTF-8
#############################
# tests/models/user_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::UserTest < Minitest::Test
  include ModelTests

  def setup
    @model = build :user
  end
end
