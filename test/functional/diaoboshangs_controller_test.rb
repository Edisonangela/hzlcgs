require 'test_helper'

class DiaoboshangsControllerTest < ActionController::TestCase
  setup do
    @diaoboshang = diaoboshangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diaoboshangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diaoboshang" do
    assert_difference('Diaoboshang.count') do
      post :create, diaoboshang: { dizhi: @diaoboshang.dizhi, leixing: @diaoboshang.leixing, liutongxuke: @diaoboshang.liutongxuke, name: @diaoboshang.name, zhizhao: @diaoboshang.zhizhao }
    end

    assert_redirected_to diaoboshang_path(assigns(:diaoboshang))
  end

  test "should show diaoboshang" do
    get :show, id: @diaoboshang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diaoboshang
    assert_response :success
  end

  test "should update diaoboshang" do
    put :update, id: @diaoboshang, diaoboshang: { dizhi: @diaoboshang.dizhi, leixing: @diaoboshang.leixing, liutongxuke: @diaoboshang.liutongxuke, name: @diaoboshang.name, zhizhao: @diaoboshang.zhizhao }
    assert_redirected_to diaoboshang_path(assigns(:diaoboshang))
  end

  test "should destroy diaoboshang" do
    assert_difference('Diaoboshang.count', -1) do
      delete :destroy, id: @diaoboshang
    end

    assert_redirected_to diaoboshangs_path
  end
end
