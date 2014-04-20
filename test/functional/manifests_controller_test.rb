require 'test_helper'

class ManifestsControllerTest < ActionController::TestCase
  setup do
    @manifest = manifests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manifests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manifest" do
    assert_difference('Manifest.count') do
      post :create, :manifest => @manifest.attributes
    end

    assert_redirected_to manifest_path(assigns(:manifest))
  end

  test "should show manifest" do
    get :show, :id => @manifest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @manifest.to_param
    assert_response :success
  end

  test "should update manifest" do
    put :update, :id => @manifest.to_param, :manifest => @manifest.attributes
    assert_redirected_to manifest_path(assigns(:manifest))
  end

  test "should destroy manifest" do
    assert_difference('Manifest.count', -1) do
      delete :destroy, :id => @manifest.to_param
    end

    assert_redirected_to manifests_path
  end
end
