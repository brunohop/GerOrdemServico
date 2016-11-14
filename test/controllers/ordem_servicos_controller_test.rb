require 'test_helper'

class OrdemServicosControllerTest < ActionController::TestCase
  setup do
    @ordem_servico = ordem_servicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordem_servicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordem_servico" do
    assert_difference('OrdemServico.count') do
      post :create, ordem_servico: { data_fim: @ordem_servico.data_fim, data_inicio: @ordem_servico.data_inicio, data_previsao: @ordem_servico.data_previsao, fator_atendimento: @ordem_servico.fator_atendimento, fiscalcontrato: @ordem_servico.fiscalcontrato, os: @ordem_servico.os, preposto: @ordem_servico.preposto, proj_id: @ordem_servico.proj_id, resp_requisitante: @ordem_servico.resp_requisitante, resptecnico: @ordem_servico.resptecnico, situacao: @ordem_servico.situacao, tipo_os_id: @ordem_servico.tipo_os_id, ust_glosa: @ordem_servico.ust_glosa, ust_pago: @ordem_servico.ust_pago }
    end

    assert_redirected_to ordem_servico_path(assigns(:ordem_servico))
  end

  test "should show ordem_servico" do
    get :show, id: @ordem_servico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordem_servico
    assert_response :success
  end

  test "should update ordem_servico" do
    patch :update, id: @ordem_servico, ordem_servico: { data_fim: @ordem_servico.data_fim, data_inicio: @ordem_servico.data_inicio, data_previsao: @ordem_servico.data_previsao, fator_atendimento: @ordem_servico.fator_atendimento, fiscalcontrato: @ordem_servico.fiscalcontrato, os: @ordem_servico.os, preposto: @ordem_servico.preposto, proj_id: @ordem_servico.proj_id, resp_requisitante: @ordem_servico.resp_requisitante, resptecnico: @ordem_servico.resptecnico, situacao: @ordem_servico.situacao, tipo_os_id: @ordem_servico.tipo_os_id, ust_glosa: @ordem_servico.ust_glosa, ust_pago: @ordem_servico.ust_pago }
    assert_redirected_to ordem_servico_path(assigns(:ordem_servico))
  end

  test "should destroy ordem_servico" do
    assert_difference('OrdemServico.count', -1) do
      delete :destroy, id: @ordem_servico
    end

    assert_redirected_to ordem_servicos_path
  end
end
