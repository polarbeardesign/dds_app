require 'test_helper'

class TestAnswersControllerTest < ActionController::TestCase
  setup do
    @test_answer = test_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_answer" do
    assert_difference('TestAnswer.count') do
      post :create, :test_answer => @test_answer.attributes
    end

    assert_redirected_to test_answer_path(assigns(:test_answer))
  end

  test "should show test_answer" do
    get :show, :id => @test_answer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @test_answer.to_param
    assert_response :success
  end

  test "should update test_answer" do
    put :update, :id => @test_answer.to_param, :test_answer => @test_answer.attributes
    assert_redirected_to test_answer_path(assigns(:test_answer))
  end

  test "should destroy test_answer" do
    assert_difference('TestAnswer.count', -1) do
      delete :destroy, :id => @test_answer.to_param
    end

    assert_redirected_to test_answers_path
  end
end
