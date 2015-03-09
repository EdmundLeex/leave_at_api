# encoding: UTF-8
#############################
# tests/controllers/sessions_controller_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::SessionsControllerTest < Minitest::Test
  def setup
    @user = create :user
    @cookie_key = '_leave_at_api_session'
  end

  def teardown
    @user.destroy
  end

  def test_authenticate_success
    clear_cookies
    post '/authenticate', { email: @user.email, password: @user.password }

    resp = JSON.parse last_response.body
    assert_equal SecureRandom.urlsafe_base64(32).length, resp['access_token'].length
  end

  def test_authenticate_fail
    clear_cookies
    post '/authenticate', { email: @user.email, password: @user.password + 'bar' }

    assert_equal 403, last_response.status
    assert_equal 'unauthorized', last_response.body
  end
end
