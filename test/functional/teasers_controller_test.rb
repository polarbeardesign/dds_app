require 'test_helper'

class TeasersControllerTest < ActionController::TestCase
  setup do
    @teaser = teasers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teasers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teaser" do
    assert_difference('Teaser.count') do
      post :create, :teaser => @teaser.attributes
    end

    assert_redirected_to teaser_path(assigns(:teaser))
  end

  test "should show teaser" do
    get :show, :id => @teaser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teaser.to_param
    assert_response :success
  end

  test "should update teaser" do
    put :update, :id => @teaser.to_param, :teaser => @teaser.attributes
    assert_redirected_to teaser_path(assigns(:teaser))
  end

  test "should destroy teaser" do
    assert_difference('Teaser.count', -1) do
      delete :destroy, :id => @teaser.to_param
    end

    assert_redirected_to teasers_path
  end
end
