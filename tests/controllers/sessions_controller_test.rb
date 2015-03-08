# encoding: UTF-8
#############################
# tests/controllers/sessions_controller_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::SessionsControllerTest < Minitest::Test
  def setup
    @user = create :user
    @base_url = LeaveAtApi::SessionsController::BASE_URL
  end

  def teardown
    @user.destroy
  end
end
