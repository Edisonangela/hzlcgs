require 'test_helper'

class ChangjiaControllerTest < ActionController::TestCase
  setup do
    @changjium = changjia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:changjia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create changjium" do
    assert_difference('Changjium.count') do
      post :create, changjium: { dizhi: @changjium.dizhi, fangyi: @changjium.fangyi, leixing: @changjium.leixing, name: @changjium.name, shengchanxuke: @changjium.shengchanxuke, yangzhi: @changjium.yangzhi, zhizhao: @changjium.zhizhao }
    end

    assert_redirected_to changjium_path(assigns(:changjium))
  end

  test "should show changjium" do
    get :show, id: @changjium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @changjium
    assert_response :success
  end

  test "should update changjium" do
    put :update, id: @changjium, changjium: { dizhi: @changjium.dizhi, fangyi: @changjium.fangyi, leixing: @changjium.leixing, name: @changjium.name, shengchanxuke: @changjium.shengchanxuke, yangzhi: @changjium.yangzhi, zhizhao: @changjium.zhizhao }
    assert_redirected_to changjium_path(assigns(:changjium))
  end

  test "should destroy changjium" do
    assert_difference('Changjium.count', -1) do
      delete :destroy, id: @changjium
    end

    assert_redirected_to changjia_path
  end
end
