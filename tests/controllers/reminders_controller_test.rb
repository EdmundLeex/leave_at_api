# encoding: UTF-8
#############################
# tests/controllers/reminders_controller_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::RemindersControllerTest < Minitest::Test
  def setup
    @model = create :reminder
    @base_url = LeaveAtApi::RemindersController::BASE_URL
  end

  def teardown
    @model.user.destroy
    @model.destroy
  end

  def test_get_index
    get @base_url
    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal [@model.id], parsed_resp.map { |r| r['id'] }
  end

  def test_get_with_id
    get @base_url + '/' + @model.id.to_s
    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal @model.id, parsed_resp['id']
  end

  def test_update_success
    post @base_url + '/' + @model.id.to_s, { email: 'test@test.com' }.to_json
    assert 200, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_equal 'test@test.com', parsed_resp['email']
  end

  def test_update_fail
    post @base_url + '/' + @model.id.to_s, { origin: nil }.to_json
    assert 400, last_response.status

    parsed_resp = JSON.parse last_response.body
    assert_includes parsed_resp.keys, 'origin'
  end
end
