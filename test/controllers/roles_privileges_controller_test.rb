require 'test_helper'

class RolesPrivilegesControllerTest < ActionController::TestCase
  setup do
    @roles_privilege = roles_privileges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles_privileges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roles_privilege" do
    assert_difference('RolesPrivilege.count') do
      post :create, roles_privilege: { privilege: @roles_privilege.privilege, role: @roles_privilege.role }
    end

    assert_redirected_to roles_privilege_path(assigns(:roles_privilege))
  end

  test "should show roles_privilege" do
    get :show, id: @roles_privilege
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roles_privilege
    assert_response :success
  end

  test "should update roles_privilege" do
    patch :update, id: @roles_privilege, roles_privilege: { privilege: @roles_privilege.privilege, role: @roles_privilege.role }
    assert_redirected_to roles_privilege_path(assigns(:roles_privilege))
  end

  test "should destroy roles_privilege" do
    assert_difference('RolesPrivilege.count', -1) do
      delete :destroy, id: @roles_privilege
    end

    assert_redirected_to roles_privileges_path
  end
end
