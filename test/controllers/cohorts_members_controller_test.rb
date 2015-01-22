require 'test_helper'

class CohortsMembersControllerTest < ActionController::TestCase
  setup do
    @cohorts_member = cohorts_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cohorts_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cohorts_member" do
    assert_difference('CohortsMember.count') do
      post :create, cohorts_member: { cohort_id: @cohorts_member.cohort_id, patient_id: @cohorts_member.patient_id }
    end

    assert_redirected_to cohorts_member_path(assigns(:cohorts_member))
  end

  test "should show cohorts_member" do
    get :show, id: @cohorts_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cohorts_member
    assert_response :success
  end

  test "should update cohorts_member" do
    patch :update, id: @cohorts_member, cohorts_member: { cohort_id: @cohorts_member.cohort_id, patient_id: @cohorts_member.patient_id }
    assert_redirected_to cohorts_member_path(assigns(:cohorts_member))
  end

  test "should destroy cohorts_member" do
    assert_difference('CohortsMember.count', -1) do
      delete :destroy, id: @cohorts_member
    end

    assert_redirected_to cohorts_members_path
  end
end
