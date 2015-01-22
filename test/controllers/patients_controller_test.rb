require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { changed_by: @patient.changed_by, creator: @patient.creator, date_changed: @patient.date_changed, date_created: @patient.date_created, date_voided: @patient.date_voided, tribe: @patient.tribe, void_reason: @patient.void_reason, voided: @patient.voided, voided_by: @patient.voided_by }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { changed_by: @patient.changed_by, creator: @patient.creator, date_changed: @patient.date_changed, date_created: @patient.date_created, date_voided: @patient.date_voided, tribe: @patient.tribe, void_reason: @patient.void_reason, voided: @patient.voided, voided_by: @patient.voided_by }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
