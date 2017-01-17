class LaudosController < ApplicationController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy]

  def identificador_os
      "OS "+@ordem_servico.id.to_s+" - "+@ordem_servico.data_inicio.month.to_s+"/"+@ordem_servico.data_inicio.year.to_s+" - "+@ordem_servico.projeto.nome+" Sprint"+ @ordem_servico.sprint.to_s
  end
  helper_method :identificador_os


  # GET /laudoslaudos/1/imprimir
  def imprimir
      @ordem_servico = OrdemServico.find(params[:os_id])
      calcula_total()
      render "imprimir"
  end

  # GET /laudos/1/laudo
  def laudo
      @ordem_servico = OrdemServico.find(params[:os_id])
      @total_ust_demonstrado = calcula_total_ust_tarefas(OsTarefa.situacoes[0]) + calcula_total_ust_tarefas(OsTarefa.situacoes[1]) + calcula_total_ust_tarefas(OsTarefa.situacoes[2])
      @total_horas_demonstrado = calcula_total_horas_tarefas(OsTarefa.situacoes[0]) + calcula_total_horas_tarefas(OsTarefa.situacoes[1]) + calcula_total_horas_tarefas(OsTarefa.situacoes[2])
      @total_tarefas_demonstrado = calcula_qtd_tarefas(OsTarefa.situacoes[0]) + calcula_qtd_tarefas(OsTarefa.situacoes[1]) + calcula_qtd_tarefas(OsTarefa.situacoes[2])
      @total_ust_aceito = calcula_total_ust_tarefas(OsTarefa.situacoes[0])+ calcula_total_ust_tarefas(OsTarefa.situacoes[1])
      @total_horas_aceito = calcula_total_horas_tarefas(OsTarefa.situacoes[0])+ calcula_total_horas_tarefas(OsTarefa.situacoes[1])
      @total_tarefas_aceito = calcula_qtd_tarefas(OsTarefa.situacoes[0])+ calcula_qtd_tarefas(OsTarefa.situacoes[1])
      @total_debitos_tecnicos=calcula_total_debitos_tecnicos()
      @total_tarefas_nao_entregues=calcula_total_tarefas_nao_entregues()
      @total_entregaveis_nao_entregues=calcula_total_entregaveis(OsEntregavel.situacoes[2])+calcula_total_entregaveis(OsEntregavel.situacoes[3])
      @total_entregaveis_demonstrados=calcula_total_entregaveis(OsEntregavel.situacoes[0])+calcula_total_entregaveis(OsEntregavel.situacoes[1])+calcula_total_entregaveis(OsEntregavel.situacoes[2])+calcula_total_entregaveis(OsEntregavel.situacoes[3])
      @total_entregaveis_aceitos=calcula_total_entregaveis(OsEntregavel.situacoes[0])+calcula_total_entregaveis(OsEntregavel.situacoes[1])
      render "laudo"
  end


  def calcula_total_ust_tarefas(situacao)
    total_ust_tarefas=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if os_tarefa.ust_tarefa
        if situacao==os_tarefa.situacao
          total_ust_tarefas =   total_ust_tarefas + os_tarefa.ust_tarefa
        end
      end
    end
  total_ust_tarefas
  end

  def calcula_qtd_tarefas(situacao)
    qtd_tarefas=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if os_tarefa.ust_tarefa
        if situacao==os_tarefa.situacao
          qtd_tarefas =   qtd_tarefas + 1
        end
      end
    end
  qtd_tarefas
  end

  def calcula_total_horas_tarefas(situacao)
    total_horas_tarefas=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if os_tarefa.horastarefa
        if situacao==os_tarefa.situacao
          total_horas_tarefas =   total_horas_tarefas + os_tarefa.horastarefa
        end
      end
    end
  total_horas_tarefas
  end

  def calcula_total_debitos_tecnicos()
    total_debitos_tecnicos=0
     @ordem_servico.os_tarefas.each do |os_tarefa|
       os_tarefa.tarefa_deb_tecnicos.each do |tarefa_deb_tecnico|
          total_debitos_tecnicos =   total_debitos_tecnicos + 1
      end
    end
  total_debitos_tecnicos
  end

  def calcula_total_tarefas_nao_entregues()
    total_tarefas_nao_entregues=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if OsTarefa.situacoes[2]==os_tarefa.situacao
        total_tarefas_nao_entregues=total_tarefas_nao_entregues+1
      end
    end
  total_tarefas_nao_entregues
  end

  def calcula_total_entregaveis(situacao)
    total_entregaveis_nao_entregues=0
    @ordem_servico.os_entregavels.each do |os_entregavel|
      if os_entregavel.situacao==situacao
        total_entregaveis_nao_entregues=total_entregaveis_nao_entregues+1
      end
    end
  total_entregaveis_nao_entregues
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordem_servico
      @ordem_servico = OrdemServico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordem_servico_params
      params.require(:ordem_servico).permit(:observacoes, :fiscal_contrato_id, :projeto_id, :preposto_id, :resp_tecnico_id, :descricao, :sprint, :data_inicio, :data_previsao, :data_fim, :situacao, :resp_requisitante_id, :tipo_os_id, :fator_atendimento, :ust_pago, :ust_glosa)
    end
end
