require 'test_helper'

class EncountersControllerTest < ActionController::TestCase
  setup do
    @encounter = encounters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encounters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post :create, encounter: { changed_by: @encounter.changed_by, creator: @encounter.creator, date_changed: @encounter.date_changed, date_created: @encounter.date_created, date_voided: @encounter.date_voided, encounter_datetime: @encounter.encounter_datetime, encounter_type: @encounter.encounter_type, form_id: @encounter.form_id, location_id: @encounter.location_id, patient_id: @encounter.patient_id, provider_id: @encounter.provider_id, uuid: @encounter.uuid, void_reason: @encounter.void_reason, voided: @encounter.voided, voided_by: @encounter.voided_by }
    end

    assert_redirected_to encounter_path(assigns(:encounter))
  end

  test "should show encounter" do
    get :show, id: @encounter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encounter
    assert_response :success
  end

  test "should update encounter" do
    patch :update, id: @encounter, encounter: { changed_by: @encounter.changed_by, creator: @encounter.creator, date_changed: @encounter.date_changed, date_created: @encounter.date_created, date_voided: @encounter.date_voided, encounter_datetime: @encounter.encounter_datetime, encounter_type: @encounter.encounter_type, form_id: @encounter.form_id, location_id: @encounter.location_id, patient_id: @encounter.patient_id, provider_id: @encounter.provider_id, uuid: @encounter.uuid, void_reason: @encounter.void_reason, voided: @encounter.voided, voided_by: @encounter.voided_by }
    assert_redirected_to encounter_path(assigns(:encounter))
  end

  test "should destroy encounter" do
    assert_difference('Encounter.count', -1) do
      delete :destroy, id: @encounter
    end

    assert_redirected_to encounters_path
  end
end
