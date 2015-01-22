require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address1: @location.address1, address2: @location.address2, city_village: @location.city_village, country: @location.country, country_district: @location.country_district, creator: @location.creator, date_created: @location.date_created, date_retired: @location.date_retired, description: @location.description, latitude: @location.latitude, longitude: @location.longitude, name: @location.name, neighborhood_cell: @location.neighborhood_cell, parent_location: @location.parent_location, postal_code: @location.postal_code, region: @location.region, retire_reason: @location.retire_reason, retired: @location.retired, retired_by: @location.retired_by, state_province: @location.state_province, subregion: @location.subregion, township_division: @location.township_division, uuid: @location.uuid }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { address1: @location.address1, address2: @location.address2, city_village: @location.city_village, country: @location.country, country_district: @location.country_district, creator: @location.creator, date_created: @location.date_created, date_retired: @location.date_retired, description: @location.description, latitude: @location.latitude, longitude: @location.longitude, name: @location.name, neighborhood_cell: @location.neighborhood_cell, parent_location: @location.parent_location, postal_code: @location.postal_code, region: @location.region, retire_reason: @location.retire_reason, retired: @location.retired, retired_by: @location.retired_by, state_province: @location.state_province, subregion: @location.subregion, township_division: @location.township_division, uuid: @location.uuid }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
