#############################
# tests/root_route_test.rb
#############################
require_relative '../test_helper'

class RootRouteTest < Minitest::Test
  def test_root_url
    get '/'

    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end
end
