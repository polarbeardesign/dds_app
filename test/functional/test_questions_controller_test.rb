require 'test_helper'

class TestQuestionsControllerTest < ActionController::TestCase
  setup do
    @test_question = test_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_question" do
    assert_difference('TestQuestion.count') do
      post :create, :test_question => @test_question.attributes
    end

    assert_redirected_to test_question_path(assigns(:test_question))
  end

  test "should show test_question" do
    get :show, :id => @test_question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @test_question.to_param
    assert_response :success
  end

  test "should update test_question" do
    put :update, :id => @test_question.to_param, :test_question => @test_question.attributes
    assert_redirected_to test_question_path(assigns(:test_question))
  end

  test "should destroy test_question" do
    assert_difference('TestQuestion.count', -1) do
      delete :destroy, :id => @test_question.to_param
    end

    assert_redirected_to test_questions_path
  end
end
