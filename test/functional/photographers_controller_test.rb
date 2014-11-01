require 'test_helper'

class PhotographersControllerTest < ActionController::TestCase
  setup do
    @photographer = photographers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photographers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photographer" do
    assert_difference('Photographer.count') do
      post :create, :photographer => @photographer.attributes
    end

    assert_redirected_to photographer_path(assigns(:photographer))
  end

  test "should show photographer" do
    get :show, :id => @photographer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @photographer.to_param
    assert_response :success
  end

  test "should update photographer" do
    put :update, :id => @photographer.to_param, :photographer => @photographer.attributes
    assert_redirected_to photographer_path(assigns(:photographer))
  end

  test "should destroy photographer" do
    assert_difference('Photographer.count', -1) do
      delete :destroy, :id => @photographer.to_param
    end

    assert_redirected_to photographers_path
  end
end
