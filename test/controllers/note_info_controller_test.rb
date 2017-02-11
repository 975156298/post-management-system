require 'test_helper'

class NoteInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get note_info_index_url
    assert_response :success
  end

end
