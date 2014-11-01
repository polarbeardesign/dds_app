require 'test_helper'

class GalleryCategoriesControllerTest < ActionController::TestCase
  setup do
    @gallery_category = gallery_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gallery_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery_category" do
    assert_difference('GalleryCategory.count') do
      post :create, :gallery_category => @gallery_category.attributes
    end

    assert_redirected_to gallery_category_path(assigns(:gallery_category))
  end

  test "should show gallery_category" do
    get :show, :id => @gallery_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gallery_category.to_param
    assert_response :success
  end

  test "should update gallery_category" do
    put :update, :id => @gallery_category.to_param, :gallery_category => @gallery_category.attributes
    assert_redirected_to gallery_category_path(assigns(:gallery_category))
  end

  test "should destroy gallery_category" do
    assert_difference('GalleryCategory.count', -1) do
      delete :destroy, :id => @gallery_category.to_param
    end

    assert_redirected_to gallery_categories_path
  end
end
