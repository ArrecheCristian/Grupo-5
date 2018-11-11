require 'test_helper'

class HomeUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_users_index_url
    assert_response :success
  end

end
