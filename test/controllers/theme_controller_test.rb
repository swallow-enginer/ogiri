require "test_helper"

class ThemeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theme_index_url
    assert_response :success
  end

  test "should get show" do
    get theme_show_url
    assert_response :success
  end

  test "should get create" do
    get theme_create_url
    assert_response :success
  end

  test "should get new" do
    get theme_new_url
    assert_response :success
  end
end
