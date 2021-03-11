require 'test_helper'

class TestSubmissionsControllerTest < ActionController::TestCase
  setup do
    @test_submission = test_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_submission" do
    assert_difference('TestSubmission.count') do
      post :create, :test_submission => @test_submission.attributes
    end

    assert_redirected_to test_submission_path(assigns(:test_submission))
  end

  test "should show test_submission" do
    get :show, :id => @test_submission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @test_submission.to_param
    assert_response :success
  end

  test "should update test_submission" do
    put :update, :id => @test_submission.to_param, :test_submission => @test_submission.attributes
    assert_redirected_to test_submission_path(assigns(:test_submission))
  end

  test "should destroy test_submission" do
    assert_difference('TestSubmission.count', -1) do
      delete :destroy, :id => @test_submission.to_param
    end

    assert_redirected_to test_submissions_path
  end
end
