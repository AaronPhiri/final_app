require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { birthdate: @person.birthdate, birthdate_estimated: @person.birthdate_estimated, cause_of_death: @person.cause_of_death, changed_by: @person.changed_by, creator: @person.creator, date_changed: @person.date_changed, date_created: @person.date_created, date_voided: @person.date_voided, dead: @person.dead, death_date: @person.death_date, gender: @person.gender, uuid: @person.uuid, void_reason: @person.void_reason, voided: @person.voided, voided_by: @person.voided_by }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { birthdate: @person.birthdate, birthdate_estimated: @person.birthdate_estimated, cause_of_death: @person.cause_of_death, changed_by: @person.changed_by, creator: @person.creator, date_changed: @person.date_changed, date_created: @person.date_created, date_voided: @person.date_voided, dead: @person.dead, death_date: @person.death_date, gender: @person.gender, uuid: @person.uuid, void_reason: @person.void_reason, voided: @person.voided, voided_by: @person.voided_by }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
