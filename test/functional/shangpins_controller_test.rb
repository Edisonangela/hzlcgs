require 'test_helper'

class ShangpinsControllerTest < ActionController::TestCase
  setup do
    @shangpin = shangpins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shangpins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shangpin" do
    assert_difference('Shangpin.count') do
      post :create, shangpin: { chang_shang_id: @shangpin.chang_shang_id, guige: @shangpin.guige, leixing: @shangpin.leixing, name: @shangpin.name }
    end

    assert_redirected_to shangpin_path(assigns(:shangpin))
  end

  test "should show shangpin" do
    get :show, id: @shangpin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shangpin
    assert_response :success
  end

  test "should update shangpin" do
    put :update, id: @shangpin, shangpin: { chang_shang_id: @shangpin.chang_shang_id, guige: @shangpin.guige, leixing: @shangpin.leixing, name: @shangpin.name }
    assert_redirected_to shangpin_path(assigns(:shangpin))
  end

  test "should destroy shangpin" do
    assert_difference('Shangpin.count', -1) do
      delete :destroy, id: @shangpin
    end

    assert_redirected_to shangpins_path
  end
end
