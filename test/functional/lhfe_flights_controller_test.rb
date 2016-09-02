require 'test_helper'

class LhfeFlightsControllerTest < ActionController::TestCase
  setup do
    @lhfe_flight = lhfe_flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lhfe_flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lhfe_flight" do
    assert_difference('LhfeFlight.count') do
      post :create, :lhfe_flight => @lhfe_flight.attributes
    end

    assert_redirected_to lhfe_flight_path(assigns(:lhfe_flight))
  end

  test "should show lhfe_flight" do
    get :show, :id => @lhfe_flight.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lhfe_flight.to_param
    assert_response :success
  end

  test "should update lhfe_flight" do
    put :update, :id => @lhfe_flight.to_param, :lhfe_flight => @lhfe_flight.attributes
    assert_redirected_to lhfe_flight_path(assigns(:lhfe_flight))
  end

  test "should destroy lhfe_flight" do
    assert_difference('LhfeFlight.count', -1) do
      delete :destroy, :id => @lhfe_flight.to_param
    end

    assert_redirected_to lhfe_flights_path
  end
end
