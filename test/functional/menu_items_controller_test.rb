require 'test_helper'

class MenuItemsControllerTest < ActionController::TestCase
  setup do
    @menu_item = menu_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_item" do
    assert_difference('MenuItem.count') do
      post :create, menu_item: { display: @menu_item.display, parent_id: @menu_item.parent_id, position: @menu_item.position, url: @menu_item.url }
    end

    assert_redirected_to menu_item_path(assigns(:menu_item))
  end

  test "should show menu_item" do
    get :show, id: @menu_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_item
    assert_response :success
  end

  test "should update menu_item" do
    put :update, id: @menu_item, menu_item: { display: @menu_item.display, parent_id: @menu_item.parent_id, position: @menu_item.position, url: @menu_item.url }
    assert_redirected_to menu_item_path(assigns(:menu_item))
  end

  test "should destroy menu_item" do
    assert_difference('MenuItem.count', -1) do
      delete :destroy, id: @menu_item
    end

    assert_redirected_to menu_items_path
  end
end
