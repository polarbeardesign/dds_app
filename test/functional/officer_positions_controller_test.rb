require 'test_helper'

class OfficerPositionsControllerTest < ActionController::TestCase
  setup do
    @officer_position = officer_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:officer_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create officer_position" do
    assert_difference('OfficerPosition.count') do
      post :create, :officer_position => @officer_position.attributes
    end

    assert_redirected_to officer_position_path(assigns(:officer_position))
  end

  test "should show officer_position" do
    get :show, :id => @officer_position.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @officer_position.to_param
    assert_response :success
  end

  test "should update officer_position" do
    put :update, :id => @officer_position.to_param, :officer_position => @officer_position.attributes
    assert_redirected_to officer_position_path(assigns(:officer_position))
  end

  test "should destroy officer_position" do
    assert_difference('OfficerPosition.count', -1) do
      delete :destroy, :id => @officer_position.to_param
    end

    assert_redirected_to officer_positions_path
  end
end
