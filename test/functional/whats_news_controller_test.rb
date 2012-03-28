require 'test_helper'

class WhatsNewsControllerTest < ActionController::TestCase
  setup do
    @whats_news = whats_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whats_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whats_news" do
    assert_difference('WhatsNew.count') do
      post :create, :whats_news => @whats_news.attributes
    end

    assert_redirected_to whats_news_path(assigns(:whats_news))
  end

  test "should show whats_news" do
    get :show, :id => @whats_news.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @whats_news.to_param
    assert_response :success
  end

  test "should update whats_news" do
    put :update, :id => @whats_news.to_param, :whats_news => @whats_news.attributes
    assert_redirected_to whats_news_path(assigns(:whats_news))
  end

  test "should destroy whats_news" do
    assert_difference('WhatsNew.count', -1) do
      delete :destroy, :id => @whats_news.to_param
    end

    assert_redirected_to whats_news_path
  end
end
