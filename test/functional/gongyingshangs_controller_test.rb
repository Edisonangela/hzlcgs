require 'test_helper'

class GongyingshangsControllerTest < ActionController::TestCase
  setup do
    @gongyingshang = gongyingshangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gongyingshangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gongyingshang" do
    assert_difference('Gongyingshang.count') do
      post :create, gongyingshang: { dizhi: @gongyingshang.dizhi, leixing: @gongyingshang.leixing, liutongxuke: @gongyingshang.liutongxuke, name: @gongyingshang.name, zhizhao: @gongyingshang.zhizhao }
    end

    assert_redirected_to gongyingshang_path(assigns(:gongyingshang))
  end

  test "should show gongyingshang" do
    get :show, id: @gongyingshang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gongyingshang
    assert_response :success
  end

  test "should update gongyingshang" do
    put :update, id: @gongyingshang, gongyingshang: { dizhi: @gongyingshang.dizhi, leixing: @gongyingshang.leixing, liutongxuke: @gongyingshang.liutongxuke, name: @gongyingshang.name, zhizhao: @gongyingshang.zhizhao }
    assert_redirected_to gongyingshang_path(assigns(:gongyingshang))
  end

  test "should destroy gongyingshang" do
    assert_difference('Gongyingshang.count', -1) do
      delete :destroy, id: @gongyingshang
    end

    assert_redirected_to gongyingshangs_path
  end
end
