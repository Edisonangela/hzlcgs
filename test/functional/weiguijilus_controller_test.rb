require 'test_helper'

class WeiguijilusControllerTest < ActionController::TestCase
  setup do
    @weiguijilu = weiguijilus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weiguijilus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weiguijilu" do
    assert_difference('Weiguijilu.count') do
      post :create, weiguijilu: { chuliqingkuang: @weiguijilu.chuliqingkuang, guifan_id: @weiguijilu.guifan_id, id: @weiguijilu.id, koufen: @weiguijilu.koufen, shijian: @weiguijilu.shijian, shuanghu_id: @weiguijilu.shuanghu_id, user_id: @weiguijilu.user_id, weiguineirong: @weiguijilu.weiguineirong, xinyongzhouqi_id: @weiguijilu.xinyongzhouqi_id, yuangong_id: @weiguijilu.yuangong_id }
    end

    assert_redirected_to weiguijilu_path(assigns(:weiguijilu))
  end

  test "should show weiguijilu" do
    get :show, id: @weiguijilu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weiguijilu
    assert_response :success
  end

  test "should update weiguijilu" do
    put :update, id: @weiguijilu, weiguijilu: { chuliqingkuang: @weiguijilu.chuliqingkuang, guifan_id: @weiguijilu.guifan_id, id: @weiguijilu.id, koufen: @weiguijilu.koufen, shijian: @weiguijilu.shijian, shuanghu_id: @weiguijilu.shuanghu_id, user_id: @weiguijilu.user_id, weiguineirong: @weiguijilu.weiguineirong, xinyongzhouqi_id: @weiguijilu.xinyongzhouqi_id, yuangong_id: @weiguijilu.yuangong_id }
    assert_redirected_to weiguijilu_path(assigns(:weiguijilu))
  end

  test "should destroy weiguijilu" do
    assert_difference('Weiguijilu.count', -1) do
      delete :destroy, id: @weiguijilu
    end

    assert_redirected_to weiguijilus_path
  end
end
