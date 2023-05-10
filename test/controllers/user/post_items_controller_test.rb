require "test_helper"

class User::PostItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_post_items_index_url
    assert_response :success
  end

  test "should get new" do
    get user_post_items_new_url
    assert_response :success
  end

  test "should get create" do
    get user_post_items_create_url
    assert_response :success
  end

  test "should get show" do
    get user_post_items_show_url
    assert_response :success
  end
end
