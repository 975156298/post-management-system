require 'test_helper'

class UserCenterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_center_index_url
    assert_response :success
  end

end
