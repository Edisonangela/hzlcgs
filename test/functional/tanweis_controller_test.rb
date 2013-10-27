require 'test_helper'

class TanweisControllerTest < ActionController::TestCase
  setup do
    @tanwei = tanweis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tanweis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tanwei" do
    assert_difference('Tanwei.count') do
      post :create, tanwei: { mianji: @tanwei.mianji, tanweihao: @tanwei.tanweihao }
    end

    assert_redirected_to tanwei_path(assigns(:tanwei))
  end

  test "should show tanwei" do
    get :show, id: @tanwei
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tanwei
    assert_response :success
  end

  test "should update tanwei" do
    put :update, id: @tanwei, tanwei: { mianji: @tanwei.mianji, tanweihao: @tanwei.tanweihao }
    assert_redirected_to tanwei_path(assigns(:tanwei))
  end

  test "should destroy tanwei" do
    assert_difference('Tanwei.count', -1) do
      delete :destroy, id: @tanwei
    end

    assert_redirected_to tanweis_path
  end
end
