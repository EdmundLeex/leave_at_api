# encoding: UTF-8
#############################
# tests/models/reminder_test.rb
#############################
require_relative '../test_helper'

class LeaveAtApi::ReminderTest < Minitest::Test
  REQUIRED_ATTRS = { origin: 'foo',
                     destination: 'bar',
                     arrival_time: Time.now,
                     is_finished: false }

  def setup
    @model = LeaveAtApi::Reminder.new(REQUIRED_ATTRS)
  end

  def teardown
    @model.destroy
  end

  # test required attrs
  REQUIRED_ATTRS.each do |attr_name, value|
    define_method "test_required_attr_#{attr_name}" do
      assert @model.valid?

      @model.send "#{attr_name}=", nil
      refute @model.valid?, "'#{attr_name}' should be required"

      @model.send "#{attr_name}=", value
    end
  end

  def test_class_method_active_for
    interval = 2.hours

    @model.arrival_time = Time.now + interval - 5.minutes
    @model.save!

    assert_includes @model.class.active_for(interval), @model
  end
end
