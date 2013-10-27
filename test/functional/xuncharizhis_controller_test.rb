require 'test_helper'

class XuncharizhisControllerTest < ActionController::TestCase
  setup do
    @xuncharizhi = xuncharizhis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xuncharizhis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xuncharizhi" do
    assert_difference('Xuncharizhi.count') do
      post :create, xuncharizhi: { faqishijian: @xuncharizhi.faqishijian, id: @xuncharizhi.id, kefuhuifu: @xuncharizhi.kefuhuifu, kefutishi: @xuncharizhi.kefutishi, kefuwanchengshijian: @xuncharizhi.kefuwanchengshijian, shanghu_id: @xuncharizhi.shanghu_id, user_id: @xuncharizhi.user_id, wenti: @xuncharizhi.wenti, wentidalei: @xuncharizhi.wentidalei, zhuangtai: @xuncharizhi.zhuangtai }
    end

    assert_redirected_to xuncharizhi_path(assigns(:xuncharizhi))
  end

  test "should show xuncharizhi" do
    get :show, id: @xuncharizhi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xuncharizhi
    assert_response :success
  end

  test "should update xuncharizhi" do
    put :update, id: @xuncharizhi, xuncharizhi: { faqishijian: @xuncharizhi.faqishijian, id: @xuncharizhi.id, kefuhuifu: @xuncharizhi.kefuhuifu, kefutishi: @xuncharizhi.kefutishi, kefuwanchengshijian: @xuncharizhi.kefuwanchengshijian, shanghu_id: @xuncharizhi.shanghu_id, user_id: @xuncharizhi.user_id, wenti: @xuncharizhi.wenti, wentidalei: @xuncharizhi.wentidalei, zhuangtai: @xuncharizhi.zhuangtai }
    assert_redirected_to xuncharizhi_path(assigns(:xuncharizhi))
  end

  test "should destroy xuncharizhi" do
    assert_difference('Xuncharizhi.count', -1) do
      delete :destroy, id: @xuncharizhi
    end

    assert_redirected_to xuncharizhis_path
  end
end
