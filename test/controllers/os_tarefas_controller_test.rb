require 'test_helper'

class OsTarefasControllerTest < ActionController::TestCase
  setup do
    @os_tarefa = os_tarefas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_tarefas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_tarefa" do
    assert_difference('OsTarefa.count') do
      post :create, os_tarefa: { catl_id: @os_tarefa.catl_id, entregavel_id: @os_tarefa.entregavel_id, id_tarefa_redmnine: @os_tarefa.id_tarefa_redmnine, nurm_horastarefa: @os_tarefa.nurm_horastarefa, os_id: @os_tarefa.os_id, pess_abertura_tarefa: @os_tarefa.pess_abertura_tarefa, prod_id: @os_tarefa.prod_id, tarefa_atribuida: @os_tarefa.tarefa_atribuida, ust_tarefa: @os_tarefa.ust_tarefa }
    end

    assert_redirected_to os_tarefa_path(assigns(:os_tarefa))
  end

  test "should show os_tarefa" do
    get :show, id: @os_tarefa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_tarefa
    assert_response :success
  end

  test "should update os_tarefa" do
    patch :update, id: @os_tarefa, os_tarefa: { catl_id: @os_tarefa.catl_id, entregavel_id: @os_tarefa.entregavel_id, id_tarefa_redmnine: @os_tarefa.id_tarefa_redmnine, nurm_horastarefa: @os_tarefa.nurm_horastarefa, os_id: @os_tarefa.os_id, pess_abertura_tarefa: @os_tarefa.pess_abertura_tarefa, prod_id: @os_tarefa.prod_id, tarefa_atribuida: @os_tarefa.tarefa_atribuida, ust_tarefa: @os_tarefa.ust_tarefa }
    assert_redirected_to os_tarefa_path(assigns(:os_tarefa))
  end

  test "should destroy os_tarefa" do
    assert_difference('OsTarefa.count', -1) do
      delete :destroy, id: @os_tarefa
    end

    assert_redirected_to os_tarefas_path
  end
end
