require 'test_helper'

class YuangongsControllerTest < ActionController::TestCase
  setup do
    @yuangong = yuangongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yuangongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yuangong" do
    assert_difference('Yuangong.count') do
      post :create, yuangong: { dianhua: @yuangong.dianhua, id: @yuangong.id, jiguan: @yuangong.jiguan, name: @yuangong.name, nianling: @yuangong.nianling, sex: @yuangong.sex, shenfenzhenghao: @yuangong.shenfenzhenghao, zhaopianlujing: @yuangong.zhaopianlujing }
    end

    assert_redirected_to yuangong_path(assigns(:yuangong))
  end

  test "should show yuangong" do
    get :show, id: @yuangong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yuangong
    assert_response :success
  end

  test "should update yuangong" do
    put :update, id: @yuangong, yuangong: { dianhua: @yuangong.dianhua, id: @yuangong.id, jiguan: @yuangong.jiguan, name: @yuangong.name, nianling: @yuangong.nianling, sex: @yuangong.sex, shenfenzhenghao: @yuangong.shenfenzhenghao, zhaopianlujing: @yuangong.zhaopianlujing }
    assert_redirected_to yuangong_path(assigns(:yuangong))
  end

  test "should destroy yuangong" do
    assert_difference('Yuangong.count', -1) do
      delete :destroy, id: @yuangong
    end

    assert_redirected_to yuangongs_path
  end
end
