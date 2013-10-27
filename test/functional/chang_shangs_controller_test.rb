require 'test_helper'

class ChangShangsControllerTest < ActionController::TestCase
  setup do
    @chang_shang = chang_shangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chang_shangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chang_shang" do
    assert_difference('ChangShang.count') do
      post :create, chang_shang: { changzhi: @chang_shang.changzhi, leixing: @chang_shang.leixing, liutong: @chang_shang.liutong, name: @chang_shang.name, xuke: @chang_shang.xuke, zhizhao: @chang_shang.zhizhao }
    end

    assert_redirected_to chang_shang_path(assigns(:chang_shang))
  end

  test "should show chang_shang" do
    get :show, id: @chang_shang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chang_shang
    assert_response :success
  end

  test "should update chang_shang" do
    put :update, id: @chang_shang, chang_shang: { changzhi: @chang_shang.changzhi, leixing: @chang_shang.leixing, liutong: @chang_shang.liutong, name: @chang_shang.name, xuke: @chang_shang.xuke, zhizhao: @chang_shang.zhizhao }
    assert_redirected_to chang_shang_path(assigns(:chang_shang))
  end

  test "should destroy chang_shang" do
    assert_difference('ChangShang.count', -1) do
      delete :destroy, id: @chang_shang
    end

    assert_redirected_to chang_shangs_path
  end
end
