require 'test_helper'

class UsersRolesControllerTest < ActionController::TestCase
  setup do
    @users_role = users_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_role" do
    assert_difference('UsersRole.count') do
      post :create, users_role: { role: @users_role.role, user_id: @users_role.user_id }
    end

    assert_redirected_to users_role_path(assigns(:users_role))
  end

  test "should show users_role" do
    get :show, id: @users_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_role
    assert_response :success
  end

  test "should update users_role" do
    patch :update, id: @users_role, users_role: { role: @users_role.role, user_id: @users_role.user_id }
    assert_redirected_to users_role_path(assigns(:users_role))
  end

  test "should destroy users_role" do
    assert_difference('UsersRole.count', -1) do
      delete :destroy, id: @users_role
    end

    assert_redirected_to users_roles_path
  end
end
