require 'test_helper'

class OsEntregavelsControllerTest < ActionController::TestCase
  setup do
    @os_entregavel = os_entregavels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_entregavels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_entregavel" do
    assert_difference('OsEntregavel.count') do
      post :create, os_entregavel: { entregavel_id: @os_entregavel.entregavel_id, osi_d: @os_entregavel.osi_d, ust_previsto: @os_entregavel.ust_previsto }
    end

    assert_redirected_to os_entregavel_path(assigns(:os_entregavel))
  end

  test "should show os_entregavel" do
    get :show, id: @os_entregavel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_entregavel
    assert_response :success
  end

  test "should update os_entregavel" do
    patch :update, id: @os_entregavel, os_entregavel: { entregavel_id: @os_entregavel.entregavel_id, osi_d: @os_entregavel.osi_d, ust_previsto: @os_entregavel.ust_previsto }
    assert_redirected_to os_entregavel_path(assigns(:os_entregavel))
  end

  test "should destroy os_entregavel" do
    assert_difference('OsEntregavel.count', -1) do
      delete :destroy, id: @os_entregavel
    end

    assert_redirected_to os_entregavels_path
  end
end
