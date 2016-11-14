require 'test_helper'

class OsDebTecnicosControllerTest < ActionController::TestCase
  setup do
    @os_deb_tecnico = os_deb_tecnicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_deb_tecnicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_deb_tecnico" do
    assert_difference('OsDebTecnico.count') do
      post :create, os_deb_tecnico: { debt_id: @os_deb_tecnico.debt_id, os_id: @os_deb_tecnico.os_id }
    end

    assert_redirected_to os_deb_tecnico_path(assigns(:os_deb_tecnico))
  end

  test "should show os_deb_tecnico" do
    get :show, id: @os_deb_tecnico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_deb_tecnico
    assert_response :success
  end

  test "should update os_deb_tecnico" do
    patch :update, id: @os_deb_tecnico, os_deb_tecnico: { debt_id: @os_deb_tecnico.debt_id, os_id: @os_deb_tecnico.os_id }
    assert_redirected_to os_deb_tecnico_path(assigns(:os_deb_tecnico))
  end

  test "should destroy os_deb_tecnico" do
    assert_difference('OsDebTecnico.count', -1) do
      delete :destroy, id: @os_deb_tecnico
    end

    assert_redirected_to os_deb_tecnicos_path
  end
end
