# encoding: UTF-8
#############################
# tests/models/reminder_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::ReminderTest < Minitest::Test
  include ModelTests

  def setup
    @model = build :reminder
  end

  def teardown
    @model.user.destroy
  end

  def test_class_method_active_for
    interval = 2.hours

    @model.arrival_time = Time.now + interval - 5.minutes
    @model.save!

    assert_includes @model.class.active_for(interval), @model
  end
end
