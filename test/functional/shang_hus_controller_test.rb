require 'test_helper'

class ShangHusControllerTest < ActionController::TestCase
  setup do
    @shang_hu = shang_hus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shang_hus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shang_hu" do
    assert_difference('ShangHu.count') do
      post :create, shang_hu: { liutong: @shang_hu.liutong, tanweihao: @shang_hu.tanweihao, xuke: @shang_hu.xuke, zhizhao: @shang_hu.zhizhao, zihao: @shang_hu.zihao }
    end

    assert_redirected_to shang_hu_path(assigns(:shang_hu))
  end

  test "should show shang_hu" do
    get :show, id: @shang_hu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shang_hu
    assert_response :success
  end

  test "should update shang_hu" do
    put :update, id: @shang_hu, shang_hu: { liutong: @shang_hu.liutong, tanweihao: @shang_hu.tanweihao, xuke: @shang_hu.xuke, zhizhao: @shang_hu.zhizhao, zihao: @shang_hu.zihao }
    assert_redirected_to shang_hu_path(assigns(:shang_hu))
  end

  test "should destroy shang_hu" do
    assert_difference('ShangHu.count', -1) do
      delete :destroy, id: @shang_hu
    end

    assert_redirected_to shang_hus_path
  end
end
