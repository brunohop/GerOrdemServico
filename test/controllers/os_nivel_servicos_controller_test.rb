require 'test_helper'

class OsNivelServicosControllerTest < ActionController::TestCase
  setup do
    @os_nivel_servico = os_nivel_servicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_nivel_servicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_nivel_servico" do
    assert_difference('OsNivelServico.count') do
      post :create, os_nivel_servico: { indicador: @os_nivel_servico.indicador, nivel_servico: @os_nivel_servico.nivel_servico, os_id: @os_nivel_servico.os_id }
    end

    assert_redirected_to os_nivel_servico_path(assigns(:os_nivel_servico))
  end

  test "should show os_nivel_servico" do
    get :show, id: @os_nivel_servico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_nivel_servico
    assert_response :success
  end

  test "should update os_nivel_servico" do
    patch :update, id: @os_nivel_servico, os_nivel_servico: { indicador: @os_nivel_servico.indicador, nivel_servico: @os_nivel_servico.nivel_servico, os_id: @os_nivel_servico.os_id }
    assert_redirected_to os_nivel_servico_path(assigns(:os_nivel_servico))
  end

  test "should destroy os_nivel_servico" do
    assert_difference('OsNivelServico.count', -1) do
      delete :destroy, id: @os_nivel_servico
    end

    assert_redirected_to os_nivel_servicos_path
  end
end
