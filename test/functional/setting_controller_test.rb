require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  test "should get weeks:integer" do
    get :weeks:integer
    assert_response :success
  end

  test "should get cost:float" do
    get :cost:float
    assert_response :success
  end

  test "should get name:string" do
    get :name:string
    assert_response :success
  end

end
