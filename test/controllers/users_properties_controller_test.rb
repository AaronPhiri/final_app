require 'test_helper'

class UsersPropertiesControllerTest < ActionController::TestCase
  setup do
    @users_property = users_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_property" do
    assert_difference('UsersProperty.count') do
      post :create, users_property: { property: @users_property.property, property_value: @users_property.property_value, user_id: @users_property.user_id }
    end

    assert_redirected_to users_property_path(assigns(:users_property))
  end

  test "should show users_property" do
    get :show, id: @users_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_property
    assert_response :success
  end

  test "should update users_property" do
    patch :update, id: @users_property, users_property: { property: @users_property.property, property_value: @users_property.property_value, user_id: @users_property.user_id }
    assert_redirected_to users_property_path(assigns(:users_property))
  end

  test "should destroy users_property" do
    assert_difference('UsersProperty.count', -1) do
      delete :destroy, id: @users_property
    end

    assert_redirected_to users_properties_path
  end
end
