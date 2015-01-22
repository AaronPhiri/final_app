require 'test_helper'

class PrivilegesControllerTest < ActionController::TestCase
  setup do
    @privilege = privileges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privileges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privilege" do
    assert_difference('Privilege.count') do
      post :create, privilege: { description: @privilege.description, privilege: @privilege.privilege, uuid: @privilege.uuid }
    end

    assert_redirected_to privilege_path(assigns(:privilege))
  end

  test "should show privilege" do
    get :show, id: @privilege
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privilege
    assert_response :success
  end

  test "should update privilege" do
    patch :update, id: @privilege, privilege: { description: @privilege.description, privilege: @privilege.privilege, uuid: @privilege.uuid }
    assert_redirected_to privilege_path(assigns(:privilege))
  end

  test "should destroy privilege" do
    assert_difference('Privilege.count', -1) do
      delete :destroy, id: @privilege
    end

    assert_redirected_to privileges_path
  end
end
