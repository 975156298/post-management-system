require 'test_helper'

class LandControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get land_index_url
    assert_response :success
  end

end
