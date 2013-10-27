require 'test_helper'

class XinyongzhouqisControllerTest < ActionController::TestCase
  setup do
    @xinyongzhouqi = xinyongzhouqis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xinyongzhouqis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xinyongzhouqi" do
    assert_difference('Xinyongzhouqi.count') do
      post :create, xinyongzhouqi: { id: @xinyongzhouqi.id, name: @xinyongzhouqi.name }
    end

    assert_redirected_to xinyongzhouqi_path(assigns(:xinyongzhouqi))
  end

  test "should show xinyongzhouqi" do
    get :show, id: @xinyongzhouqi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xinyongzhouqi
    assert_response :success
  end

  test "should update xinyongzhouqi" do
    put :update, id: @xinyongzhouqi, xinyongzhouqi: { id: @xinyongzhouqi.id, name: @xinyongzhouqi.name }
    assert_redirected_to xinyongzhouqi_path(assigns(:xinyongzhouqi))
  end

  test "should destroy xinyongzhouqi" do
    assert_difference('Xinyongzhouqi.count', -1) do
      delete :destroy, id: @xinyongzhouqi
    end

    assert_redirected_to xinyongzhouqis_path
  end
end
