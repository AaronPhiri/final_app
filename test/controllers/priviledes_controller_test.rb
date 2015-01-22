require 'test_helper'

class PriviledesControllerTest < ActionController::TestCase
  setup do
    @privilede = priviledes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priviledes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privilede" do
    assert_difference('Privilede.count') do
      post :create, privilede: { description: @privilede.description, privilege: @privilede.privilege, uuid: @privilede.uuid }
    end

    assert_redirected_to privilede_path(assigns(:privilede))
  end

  test "should show privilede" do
    get :show, id: @privilede
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privilede
    assert_response :success
  end

  test "should update privilede" do
    patch :update, id: @privilede, privilede: { description: @privilede.description, privilege: @privilede.privilege, uuid: @privilede.uuid }
    assert_redirected_to privilede_path(assigns(:privilede))
  end

  test "should destroy privilede" do
    assert_difference('Privilede.count', -1) do
      delete :destroy, id: @privilede
    end

    assert_redirected_to priviledes_path
  end
end
