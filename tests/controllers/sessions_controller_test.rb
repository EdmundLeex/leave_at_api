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

  def test_login_success
    clear_cookies
    post '/login', { email: @user.email, password: @user.password }

    token = rack_mock_session.cookie_jar[@cookie_key]

    refute_nil token, 'cookie should be created'
    assert_equal SecureRandom.urlsafe_base64(32).length, token.length
  end

  def test_login_fail
    clear_cookies
    post '/login'

    assert_equal 403, last_response.status
    assert_equal 'unauthorized', last_response.body

    assert_nil rack_mock_session.cookie_jar[@cookie_key],
               'cookie should not be created'
  end
end
