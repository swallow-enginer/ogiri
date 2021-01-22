require "test_helper"

class JokeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get joke_index_url
    assert_response :success
  end

  test "should get show" do
    get joke_show_url
    assert_response :success
  end

  test "should get create" do
    get joke_create_url
    assert_response :success
  end

  test "should get new" do
    get joke_new_url
    assert_response :success
  end
end
