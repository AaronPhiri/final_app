require 'test_helper'

class DrugsControllerTest < ActionController::TestCase
  setup do
    @drug = drugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post :create, drug: { combination: @drug.combination, concept_id: @drug.concept_id, creator: @drug.creator, date_created: @drug.date_created, date_retired: @drug.date_retired, dosage_form: @drug.dosage_form, dosage_strength: @drug.dosage_strength, drug_id: @drug.drug_id, maximum_daily_dose: @drug.maximum_daily_dose, minimum_daily_dose: @drug.minimum_daily_dose, name: @drug.name, retire_reason: @drug.retire_reason, retired: @drug.retired, retired_by: @drug.retired_by, route: @drug.route, units: @drug.units, uuid: @drug.uuid }
    end

    assert_redirected_to drug_path(assigns(:drug))
  end

  test "should show drug" do
    get :show, id: @drug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drug
    assert_response :success
  end

  test "should update drug" do
    patch :update, id: @drug, drug: { combination: @drug.combination, concept_id: @drug.concept_id, creator: @drug.creator, date_created: @drug.date_created, date_retired: @drug.date_retired, dosage_form: @drug.dosage_form, dosage_strength: @drug.dosage_strength, drug_id: @drug.drug_id, maximum_daily_dose: @drug.maximum_daily_dose, minimum_daily_dose: @drug.minimum_daily_dose, name: @drug.name, retire_reason: @drug.retire_reason, retired: @drug.retired, retired_by: @drug.retired_by, route: @drug.route, units: @drug.units, uuid: @drug.uuid }
    assert_redirected_to drug_path(assigns(:drug))
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete :destroy, id: @drug
    end

    assert_redirected_to drugs_path
  end
end
