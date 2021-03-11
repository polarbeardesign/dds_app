require 'test_helper'

class TestSubmissionResponsesControllerTest < ActionController::TestCase
  setup do
    @test_submission_response = test_submission_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_submission_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_submission_response" do
    assert_difference('TestSubmissionResponse.count') do
      post :create, :test_submission_response => @test_submission_response.attributes
    end

    assert_redirected_to test_submission_response_path(assigns(:test_submission_response))
  end

  test "should show test_submission_response" do
    get :show, :id => @test_submission_response.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @test_submission_response.to_param
    assert_response :success
  end

  test "should update test_submission_response" do
    put :update, :id => @test_submission_response.to_param, :test_submission_response => @test_submission_response.attributes
    assert_redirected_to test_submission_response_path(assigns(:test_submission_response))
  end

  test "should destroy test_submission_response" do
    assert_difference('TestSubmissionResponse.count', -1) do
      delete :destroy, :id => @test_submission_response.to_param
    end

    assert_redirected_to test_submission_responses_path
  end
end
