require 'test_helper'

class EncountersTypesControllerTest < ActionController::TestCase
  setup do
    @encounters_type = encounters_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encounters_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encounters_type" do
    assert_difference('EncountersType.count') do
      post :create, encounters_type: { creator: @encounters_type.creator, date_created: @encounters_type.date_created, date_retired: @encounters_type.date_retired, description: @encounters_type.description, name: @encounters_type.name, retire_reason: @encounters_type.retire_reason, retired: @encounters_type.retired, retired_by: @encounters_type.retired_by, uuid: @encounters_type.uuid }
    end

    assert_redirected_to encounters_type_path(assigns(:encounters_type))
  end

  test "should show encounters_type" do
    get :show, id: @encounters_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encounters_type
    assert_response :success
  end

  test "should update encounters_type" do
    patch :update, id: @encounters_type, encounters_type: { creator: @encounters_type.creator, date_created: @encounters_type.date_created, date_retired: @encounters_type.date_retired, description: @encounters_type.description, name: @encounters_type.name, retire_reason: @encounters_type.retire_reason, retired: @encounters_type.retired, retired_by: @encounters_type.retired_by, uuid: @encounters_type.uuid }
    assert_redirected_to encounters_type_path(assigns(:encounters_type))
  end

  test "should destroy encounters_type" do
    assert_difference('EncountersType.count', -1) do
      delete :destroy, id: @encounters_type
    end

    assert_redirected_to encounters_types_path
  end
end
