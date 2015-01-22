require 'test_helper'

class CohortsControllerTest < ActionController::TestCase
  setup do
    @cohort = cohorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cohorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cohort" do
    assert_difference('Cohort.count') do
      post :create, cohort: { changed_by: @cohort.changed_by, creator: @cohort.creator, date_changed: @cohort.date_changed, date_created: @cohort.date_created, date_voided: @cohort.date_voided, description: @cohort.description, name: @cohort.name, uuid: @cohort.uuid, void_reason: @cohort.void_reason, voided: @cohort.voided, voided_by: @cohort.voided_by }
    end

    assert_redirected_to cohort_path(assigns(:cohort))
  end

  test "should show cohort" do
    get :show, id: @cohort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cohort
    assert_response :success
  end

  test "should update cohort" do
    patch :update, id: @cohort, cohort: { changed_by: @cohort.changed_by, creator: @cohort.creator, date_changed: @cohort.date_changed, date_created: @cohort.date_created, date_voided: @cohort.date_voided, description: @cohort.description, name: @cohort.name, uuid: @cohort.uuid, void_reason: @cohort.void_reason, voided: @cohort.voided, voided_by: @cohort.voided_by }
    assert_redirected_to cohort_path(assigns(:cohort))
  end

  test "should destroy cohort" do
    assert_difference('Cohort.count', -1) do
      delete :destroy, id: @cohort
    end

    assert_redirected_to cohorts_path
  end
end
