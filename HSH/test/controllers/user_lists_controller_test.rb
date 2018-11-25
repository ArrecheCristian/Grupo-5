require 'test_helper'

class UserListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get user_lists_show_url
    assert_response :success
  end

end
