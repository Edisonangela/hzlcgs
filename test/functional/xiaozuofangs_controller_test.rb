require 'test_helper'

class XiaozuofangsControllerTest < ActionController::TestCase
  setup do
    @xiaozuofang = xiaozuofangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xiaozuofangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xiaozuofang" do
    assert_difference('Xiaozuofang.count') do
      post :create, xiaozuofang: { dizhi: @xiaozuofang.dizhi, leixing: @xiaozuofang.leixing, name: @xiaozuofang.name }
    end

    assert_redirected_to xiaozuofang_path(assigns(:xiaozuofang))
  end

  test "should show xiaozuofang" do
    get :show, id: @xiaozuofang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xiaozuofang
    assert_response :success
  end

  test "should update xiaozuofang" do
    put :update, id: @xiaozuofang, xiaozuofang: { dizhi: @xiaozuofang.dizhi, leixing: @xiaozuofang.leixing, name: @xiaozuofang.name }
    assert_redirected_to xiaozuofang_path(assigns(:xiaozuofang))
  end

  test "should destroy xiaozuofang" do
    assert_difference('Xiaozuofang.count', -1) do
      delete :destroy, id: @xiaozuofang
    end

    assert_redirected_to xiaozuofangs_path
  end
end
