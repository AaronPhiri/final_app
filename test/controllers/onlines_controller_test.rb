require 'test_helper'

class OnlinesControllerTest < ActionController::TestCase
  setup do
    @online = onlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create online" do
    assert_difference('Online.count') do
      post :create, online: { number: @online.number, time: @online.time }
    end

    assert_redirected_to online_path(assigns(:online))
  end

  test "should show online" do
    get :show, id: @online
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @online
    assert_response :success
  end

  test "should update online" do
    patch :update, id: @online, online: { number: @online.number, time: @online.time }
    assert_redirected_to online_path(assigns(:online))
  end

  test "should destroy online" do
    assert_difference('Online.count', -1) do
      delete :destroy, id: @online
    end

    assert_redirected_to onlines_path
  end
end
