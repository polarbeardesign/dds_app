require 'test_helper'

class DuesPaymentsControllerTest < ActionController::TestCase
  setup do
    @dues_payment = dues_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dues_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dues_payment" do
    assert_difference('DuesPayment.count') do
      post :create, :dues_payment => @dues_payment.attributes
    end

    assert_redirected_to dues_payment_path(assigns(:dues_payment))
  end

  test "should show dues_payment" do
    get :show, :id => @dues_payment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dues_payment.to_param
    assert_response :success
  end

  test "should update dues_payment" do
    put :update, :id => @dues_payment.to_param, :dues_payment => @dues_payment.attributes
    assert_redirected_to dues_payment_path(assigns(:dues_payment))
  end

  test "should destroy dues_payment" do
    assert_difference('DuesPayment.count', -1) do
      delete :destroy, :id => @dues_payment.to_param
    end

    assert_redirected_to dues_payments_path
  end
end
