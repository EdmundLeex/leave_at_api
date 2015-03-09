# encoding: UTF-8
#############################
# tests/controllers/reminders_controller_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::RemindersControllerTest < Minitest::Test
  def setup
    @model = create :reminder
    @base_url = LeaveAtApi::RemindersController::BASE_URL

    authenticate @model.user
  end

  def teardown
    @model.user.destroy
    @model.destroy

    revoke @session
  end

  def test_get_index
    get @base_url

    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal [@model.id], parsed_resp.map { |r| r['id'] }
  end

  def test_get_with_id_success
    get @base_url + '/' + @model.id.to_s
    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal @model.id, parsed_resp['id']
  end

  def test_get_with_id_not_found
    get @base_url + '/' + 'foobar'

    assert 404, last_response.status
    assert_equal 'not found', last_response.body
  end

  def test_update_success
    post @base_url + '/' + @model.id.to_s, { email: 'test@test.com' }
    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal 'test@test.com', parsed_resp['email']
  end

  def test_update_fail
    post @base_url + '/' + @model.id.to_s, { origin: nil }
    assert 400, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_includes parsed_resp.keys, 'origin'
  end

  def test_update_not_found
    post @base_url + '/' + 'foobar'

    assert 404, last_response.status
    assert_equal 'not found', last_response.body
  end
end
