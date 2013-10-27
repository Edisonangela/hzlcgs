require 'test_helper'

class DaoruControllerTest < ActionController::TestCase
  test "should get tangwei" do
    get :tangwei
    assert_response :success
  end

  test "should get beian" do
    get :beian
    assert_response :success
  end

end
