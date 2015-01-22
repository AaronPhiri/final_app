require 'test_helper'

class AdministratorPageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get managerPage" do
    get :managerPage
    assert_response :success
  end

end
