require "test_helper"

class MyProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_profile_show_url
    assert_response :success
  end
end
