require 'test_helper'

class CrewPositionsControllerTest < ActionController::TestCase
  setup do
    @crew_position = crew_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crew_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crew_position" do
    assert_difference('CrewPosition.count') do
      post :create, :crew_position => @crew_position.attributes
    end

    assert_redirected_to crew_position_path(assigns(:crew_position))
  end

  test "should show crew_position" do
    get :show, :id => @crew_position.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crew_position.to_param
    assert_response :success
  end

  test "should update crew_position" do
    put :update, :id => @crew_position.to_param, :crew_position => @crew_position.attributes
    assert_redirected_to crew_position_path(assigns(:crew_position))
  end

  test "should destroy crew_position" do
    assert_difference('CrewPosition.count', -1) do
      delete :destroy, :id => @crew_position.to_param
    end

    assert_redirected_to crew_positions_path
  end
end
