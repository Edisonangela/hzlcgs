require 'test_helper'

class XinyongtongjisControllerTest < ActionController::TestCase
  setup do
    @xinyongtongji = xinyongtongjis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xinyongtongjis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xinyongtongji" do
    assert_difference('Xinyongtongji.count') do
      post :create, xinyongtongji: { defen: @xinyongtongji.defen, id: @xinyongtongji.id, shanghu_id: @xinyongtongji.shanghu_id, xinyongzhouqi_id: @xinyongtongji.xinyongzhouqi_id }
    end

    assert_redirected_to xinyongtongji_path(assigns(:xinyongtongji))
  end

  test "should show xinyongtongji" do
    get :show, id: @xinyongtongji
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xinyongtongji
    assert_response :success
  end

  test "should update xinyongtongji" do
    put :update, id: @xinyongtongji, xinyongtongji: { defen: @xinyongtongji.defen, id: @xinyongtongji.id, shanghu_id: @xinyongtongji.shanghu_id, xinyongzhouqi_id: @xinyongtongji.xinyongzhouqi_id }
    assert_redirected_to xinyongtongji_path(assigns(:xinyongtongji))
  end

  test "should destroy xinyongtongji" do
    assert_difference('Xinyongtongji.count', -1) do
      delete :destroy, id: @xinyongtongji
    end

    assert_redirected_to xinyongtongjis_path
  end
end
