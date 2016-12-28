require 'test_helper'

class LhfeRidersControllerTest < ActionController::TestCase
  setup do
    @lhfe_rider = lhfe_riders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lhfe_riders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lhfe_rider" do
    assert_difference('LhfeRider.count') do
      post :create, lhfe_rider: { city: @lhfe_rider.city, dob: @lhfe_rider.dob, email: @lhfe_rider.email, first_name: @lhfe_rider.first_name, home_phone: @lhfe_rider.home_phone, last_name: @lhfe_rider.last_name, married: @lhfe_rider.married, occupation: @lhfe_rider.occupation, payment_amount: @lhfe_rider.payment_amount, payment_type: @lhfe_rider.payment_type, ride_date: @lhfe_rider.ride_date, spouse_name: @lhfe_rider.spouse_name, state: @lhfe_rider.state, street_1: @lhfe_rider.street_1, street_2: @lhfe_rider.street_2, work_phone: @lhfe_rider.work_phone, zip: @lhfe_rider.zip }
    end

    assert_redirected_to lhfe_rider_path(assigns(:lhfe_rider))
  end

  test "should show lhfe_rider" do
    get :show, id: @lhfe_rider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lhfe_rider
    assert_response :success
  end

  test "should update lhfe_rider" do
    put :update, id: @lhfe_rider, lhfe_rider: { city: @lhfe_rider.city, dob: @lhfe_rider.dob, email: @lhfe_rider.email, first_name: @lhfe_rider.first_name, home_phone: @lhfe_rider.home_phone, last_name: @lhfe_rider.last_name, married: @lhfe_rider.married, occupation: @lhfe_rider.occupation, payment_amount: @lhfe_rider.payment_amount, payment_type: @lhfe_rider.payment_type, ride_date: @lhfe_rider.ride_date, spouse_name: @lhfe_rider.spouse_name, state: @lhfe_rider.state, street_1: @lhfe_rider.street_1, street_2: @lhfe_rider.street_2, work_phone: @lhfe_rider.work_phone, zip: @lhfe_rider.zip }
    assert_redirected_to lhfe_rider_path(assigns(:lhfe_rider))
  end

  test "should destroy lhfe_rider" do
    assert_difference('LhfeRider.count', -1) do
      delete :destroy, id: @lhfe_rider
    end

    assert_redirected_to lhfe_riders_path
  end
end
