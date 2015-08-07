require 'test_helper'

class ProductPhotosControllerTest < ActionController::TestCase
  setup do
    @product_photo = product_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_photo" do
    assert_difference('ProductPhoto.count') do
      post :create, :product_photo => @product_photo.attributes
    end

    assert_redirected_to product_photo_path(assigns(:product_photo))
  end

  test "should show product_photo" do
    get :show, :id => @product_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_photo.to_param
    assert_response :success
  end

  test "should update product_photo" do
    put :update, :id => @product_photo.to_param, :product_photo => @product_photo.attributes
    assert_redirected_to product_photo_path(assigns(:product_photo))
  end

  test "should destroy product_photo" do
    assert_difference('ProductPhoto.count', -1) do
      delete :destroy, :id => @product_photo.to_param
    end

    assert_redirected_to product_photos_path
  end
end
