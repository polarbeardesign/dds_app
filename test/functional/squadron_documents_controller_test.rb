require 'test_helper'

class SquadronDocumentsControllerTest < ActionController::TestCase
  setup do
    @squadron_document = squadron_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:squadron_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create squadron_document" do
    assert_difference('SquadronDocument.count') do
      post :create, :squadron_document => @squadron_document.attributes
    end

    assert_redirected_to squadron_document_path(assigns(:squadron_document))
  end

  test "should show squadron_document" do
    get :show, :id => @squadron_document.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @squadron_document.to_param
    assert_response :success
  end

  test "should update squadron_document" do
    put :update, :id => @squadron_document.to_param, :squadron_document => @squadron_document.attributes
    assert_redirected_to squadron_document_path(assigns(:squadron_document))
  end

  test "should destroy squadron_document" do
    assert_difference('SquadronDocument.count', -1) do
      delete :destroy, :id => @squadron_document.to_param
    end

    assert_redirected_to squadron_documents_path
  end
end
