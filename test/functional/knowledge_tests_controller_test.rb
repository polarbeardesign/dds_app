require 'test_helper'

class KnowledgeTestsControllerTest < ActionController::TestCase
  setup do
    @knowledge_test = knowledge_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_test" do
    assert_difference('KnowledgeTest.count') do
      post :create, :knowledge_test => @knowledge_test.attributes
    end

    assert_redirected_to knowledge_test_path(assigns(:knowledge_test))
  end

  test "should show knowledge_test" do
    get :show, :id => @knowledge_test.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @knowledge_test.to_param
    assert_response :success
  end

  test "should update knowledge_test" do
    put :update, :id => @knowledge_test.to_param, :knowledge_test => @knowledge_test.attributes
    assert_redirected_to knowledge_test_path(assigns(:knowledge_test))
  end

  test "should destroy knowledge_test" do
    assert_difference('KnowledgeTest.count', -1) do
      delete :destroy, :id => @knowledge_test.to_param
    end

    assert_redirected_to knowledge_tests_path
  end
end
