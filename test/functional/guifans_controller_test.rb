require 'test_helper'

class GuifansControllerTest < ActionController::TestCase
  setup do
    @guifan = guifans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guifans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guifan" do
    assert_difference('Guifan.count') do
      post :create, guifan: { dalei: @guifan.dalei, fenzhi: @guifan.fenzhi, id: @guifan.id, kaohefangshi: @guifan.kaohefangshi, kaopingbumen: @guifan.kaopingbumen, neirong: @guifan.neirong, xuhao: @guifan.xuhao }
    end

    assert_redirected_to guifan_path(assigns(:guifan))
  end

  test "should show guifan" do
    get :show, id: @guifan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guifan
    assert_response :success
  end

  test "should update guifan" do
    put :update, id: @guifan, guifan: { dalei: @guifan.dalei, fenzhi: @guifan.fenzhi, id: @guifan.id, kaohefangshi: @guifan.kaohefangshi, kaopingbumen: @guifan.kaopingbumen, neirong: @guifan.neirong, xuhao: @guifan.xuhao }
    assert_redirected_to guifan_path(assigns(:guifan))
  end

  test "should destroy guifan" do
    assert_difference('Guifan.count', -1) do
      delete :destroy, id: @guifan
    end

    assert_redirected_to guifans_path
  end
end
