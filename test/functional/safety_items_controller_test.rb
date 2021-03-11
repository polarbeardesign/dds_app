require 'test_helper'

class SafetyItemsControllerTest < ActionController::TestCase
  setup do
    @safety_item = safety_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safety_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safety_item" do
    assert_difference('SafetyItem.count') do
      post :create, :safety_item => @safety_item.attributes
    end

    assert_redirected_to safety_item_path(assigns(:safety_item))
  end

  test "should show safety_item" do
    get :show, :id => @safety_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @safety_item.to_param
    assert_response :success
  end

  test "should update safety_item" do
    put :update, :id => @safety_item.to_param, :safety_item => @safety_item.attributes
    assert_redirected_to safety_item_path(assigns(:safety_item))
  end

  test "should destroy safety_item" do
    assert_difference('SafetyItem.count', -1) do
      delete :destroy, :id => @safety_item.to_param
    end

    assert_redirected_to safety_items_path
  end
end
