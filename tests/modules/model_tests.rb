# encoding: UTF-8
#############################
# tests/modules/model_tests.rb
#############################
module ModelTests

  # test required attrs
  def test_required_attrs
    raise "@required_attrs is not defined" unless @required_attrs.is_a? Hash
    raise "@model is not defined" unless @model

    @required_attrs.each do |attr_name, value|
      assert @model.valid?

      @model.send "#{attr_name}=", nil
      refute @model.valid?, "'#{attr_name}' should be required"

      @model.send "#{attr_name}=", value
    end
  end

end
