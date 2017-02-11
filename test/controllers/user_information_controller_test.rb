require 'test_helper'

class UserInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_information_index_url
    assert_response :success
  end

end
