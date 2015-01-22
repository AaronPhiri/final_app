require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { changed_by: @user.changed_by, creator: @user.creator, date_changed: @user.date_changed, date_created: @user.date_created, date_retired: @user.date_retired, password_digest: @user.password_digest, person_id: @user.person_id, retire_reason: @user.retire_reason, retired: @user.retired, retired_by: @user.retired_by, secret_answer: @user.secret_answer, secret_question: @user.secret_question, system_id: @user.system_id, username: @user.username, uuid: @user.uuid }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { changed_by: @user.changed_by, creator: @user.creator, date_changed: @user.date_changed, date_created: @user.date_created, date_retired: @user.date_retired, password_digest: @user.password_digest, person_id: @user.person_id, retire_reason: @user.retire_reason, retired: @user.retired, retired_by: @user.retired_by, secret_answer: @user.secret_answer, secret_question: @user.secret_question, system_id: @user.system_id, username: @user.username, uuid: @user.uuid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
