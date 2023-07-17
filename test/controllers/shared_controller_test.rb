require "test_helper"

class SharedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shared_index_url
    assert_response :success
  end

  test "should get about" do
    get shared_about_url
    assert_response :success
  end
end
