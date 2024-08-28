require "test_helper"

class ItemCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_carts_index_url
    assert_response :success
  end

  test "should get new" do
    get item_carts_new_url
    assert_response :success
  end

  test "should get show" do
    get item_carts_show_url
    assert_response :success
  end

  test "should get edit" do
    get item_carts_edit_url
    assert_response :success
  end
end
