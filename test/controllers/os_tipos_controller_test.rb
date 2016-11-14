require 'test_helper'

class OsTiposControllerTest < ActionController::TestCase
  setup do
    @os_tipo = os_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_tipo" do
    assert_difference('OsTipo.count') do
      post :create, os_tipo: { os_tipo: @os_tipo.os_tipo }
    end

    assert_redirected_to os_tipo_path(assigns(:os_tipo))
  end

  test "should show os_tipo" do
    get :show, id: @os_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_tipo
    assert_response :success
  end

  test "should update os_tipo" do
    patch :update, id: @os_tipo, os_tipo: { os_tipo: @os_tipo.os_tipo }
    assert_redirected_to os_tipo_path(assigns(:os_tipo))
  end

  test "should destroy os_tipo" do
    assert_difference('OsTipo.count', -1) do
      delete :destroy, id: @os_tipo
    end

    assert_redirected_to os_tipos_path
  end
end
