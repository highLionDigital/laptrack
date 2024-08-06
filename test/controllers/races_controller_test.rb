require "test_helper"

class RacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get races_new_url
    assert_response :success
  end

  test "should get create" do
    get races_create_url
    assert_response :success
  end
end
