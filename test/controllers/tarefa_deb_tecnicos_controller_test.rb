require 'test_helper'

class TarefaDebTecnicosControllerTest < ActionController::TestCase
  setup do
    @tarefa_deb_tecnico = tarefa_deb_tecnicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarefa_deb_tecnicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarefa_deb_tecnico" do
    assert_difference('TarefaDebTecnico.count') do
      post :create, tarefa_deb_tecnico: { debt_id: @tarefa_deb_tecnico.debt_id, tare_id: @tarefa_deb_tecnico.tare_id }
    end

    assert_redirected_to tarefa_deb_tecnico_path(assigns(:tarefa_deb_tecnico))
  end

  test "should show tarefa_deb_tecnico" do
    get :show, id: @tarefa_deb_tecnico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tarefa_deb_tecnico
    assert_response :success
  end

  test "should update tarefa_deb_tecnico" do
    patch :update, id: @tarefa_deb_tecnico, tarefa_deb_tecnico: { debt_id: @tarefa_deb_tecnico.debt_id, tare_id: @tarefa_deb_tecnico.tare_id }
    assert_redirected_to tarefa_deb_tecnico_path(assigns(:tarefa_deb_tecnico))
  end

  test "should destroy tarefa_deb_tecnico" do
    assert_difference('TarefaDebTecnico.count', -1) do
      delete :destroy, id: @tarefa_deb_tecnico
    end

    assert_redirected_to tarefa_deb_tecnicos_path
  end
end
